=begin
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache LICENSE, Version 2.0 (the
"LICENSE"); you may not use this file except in compliance
with the LICENSE.  You may obtain a copy of the LICENSE at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the LICENSE is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the LICENSE for the
specific language governing permissions and limitations
under the LICENSE.
=end
require 'faraday'
require 'net/http/persistent'
require 'json'
require 'concurrent'

module HuaweiCloudSDKCore
    module HTTP
        class HttpClient
            attr_accessor :logger, :http_handler, :timeout, :proxy, :retry_times
            attr_accessor :pool_connections, :pool_maxsize, :verify, :cert
            attr_accessor :retry_status_list, :session

            def initialize(config, http_handler, logger)
                @logger = logger                
                @http_handler = http_handler

                @timeout = config.timeout
                @proxy = config.get_proxy()
                @retry_times = config.retry_times
                @pool_connections = config.pool_connections
                @pool_maxsize = config.pool_maxsize
                if config.ssl_ca_cert
                    @verify = config.ignore_ssl_verification ? config.ssl_ca_cert : config.ignore_ssl_verification
                else
                    @verify = !config.ignore_ssl_verification
                end
                if config.cert_file and config.key_file
                    @cert = [config.cert_file, config.key_file]
                else
                    @cert = config.cert_file
                end
                @retry_status_list = [429]
                @session = init_session()
            end

            def init_session
                opt = @proxy ? {proxy: @proxy} : nil
                conn = Faraday.new(opt) do |f|
                    f.adapter :net_http_persistent, pool_size: @pool_maxsize do |http|
                        http.idle_timeout = @timeout
                    end
                    f.request :retry, {
                        max: @retry_times
                    }
                    if @verify
                        if @cert.class == Array
                            f.ssl[:client_cert] = @cert[0]
                            f.ssl[:client_key] = @cert[1]
                        else
                            f.ssl[:client_cert] = @cert
                        end
                    else
                        f.ssl[:verify] = false
                    end
                end
                return conn
            end

            def do_request_sync(request)
                begin
                    if @http_handler
                        @http_handler.process_request({request: request, logger: @logger})
                    end
                    response = @session.send(request.method.downcase, request.url) do |req|
                        req.headers = request.header_params
                        req.body = request.body
                        req.body_stream =  request.stream if request.stream & request.stream.respond_to?(:read)
                    end
                rescue Faraday::ConnectionFailed => e
                    @logger.error("ConnectionException occurred. "+e.inspect)
                    raise e
                rescue Faraday::SSLError => e
                    @logger.error("SslHandShakeException occurred. "+e.inspect)
                    raise e
                rescue Faraday::Error => e
                    response_error_hook_factory(response, e)
                ensure
                    if @http_handler
                        @http_handler.process_response({response: response, logger: @logger})
                    end
                    return response
                end
            end

            def do_request_async(request)
                response = Concurrent::Promises.future{
                    begin
                        response = @session.send(request.method.downcase, request.url) do |req|
                            req.headers = request.header_params
                            req.body = request.body
                            req.body_stream =  request.stream if request.stream & request.stream.respond_to?(:read)
                        end
                    rescue StandardError => e
                        response_error_hook_factory(response, e)
                    end
                    response
                }
                return response
            end

            def response_error_hook_factory(resp, e)
                response_status_code = resp.status
                response_header_params = resp.headers
                request_id = response_header_params["X-Request-Id"]
                response_body = resp.body
                sdk_error = get_sdk_error_from_response(request_id, response_body, response_status_code)
                if e.is_a?(Faraday::ClientError)
                    raise ClientRequestException.new(response_status_code, sdk_error)
                elsif e.is_a?(Faraday::TimeoutError)
                    raise CallTimeoutException.new(e.inspect)
                elsif e.is_a?(Faraday::ServerError)
                    raise ServerResponseException.new(response_status_code, sdk_error)
                end
            end

            def get_sdk_error_from_response(request_id, response_body, response_status_code)
                sdk_error = SdkError.new()
                begin
                    sdk_error_dict = JSON.parse(response_body)
                    if  sdk_error_dict["error_code"] and  sdk_error_dict["error_msg"]
                        sdk_error = SdkError.new(request_id, sdk_error_dict["error_code"],sdk_error_dict["error_msg"])
                    elsif sdk_error_dict["code"] and sdk_error_dict["message"]
                        sdk_error = SdkError.new(request_id, sdk_error_dict["code"],sdk_error_dict["message"])
                    else
                        sdk_error_dict.each do |key, value|
                            if value.is_a?(Hash)
                                if value["code"] & value["message"]
                                    sdk_error = SdkError.new(request_id, value["code"],value["message"])
                                end
                            end
                        end
                    end
                resuce Exception => e
                    raise ServerResponseException.new(response_status_code,SdkError.new(nil, nil, response_body))
                end
                if !sdk_error.error_msg or sdk_error.error_msg == ""
                    sdk_error = SdkError.new(nil, nil, response_body)
                end                
                return sdk_error
            end
        end
    end
end