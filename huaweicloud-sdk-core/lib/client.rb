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
require "logging"
require "./http/http_handler"
require "./http/http_client"
require "open-uri"
require "./sdk_request"
require "./sdk_response"

module HuaweiCloudSDKCore
    class ClientBuilder
        def initialize(client_type, credential_type=BasicCredentials)
            @client_class = client_type
            @credential_type = credential_type
            @config = nil
            @credentials = nil
            @endpoint = nil
            @http_handler = nil
            @file_logger_handler = nil
            @stream_logger_handler = nil
        end

        def with_http_config(config)
            @config = config
            self
        end

        def with_credentials(credentials)
            @credentials = credentials
            @credential_type = credentials.class
            self
        end

        def with_endpoint(endpoint)
            @endpoint = endpoint
            self
        end

        def with_http_handler(http_handler)
            @http_handler = http_handler
            self
        end

        def with_file_log(path, log_level=logging.INFO, format_string=nil)
            @file_logger_handler = {
                "path": path,
                "log_level": log_level,
                "format_string": format_string
            }
            self
        end

        def with_stream_log(stream=STDOUT, log_level=logging.INFO, format_string=nil)
            @stream_logger_handler = {
                "stream": stream,
                "log_level": log_level,
                "format_string": format_string
            }
            self
        end

        def build
            @credentials = get_credential_from_environment_variables unless @credentials
            if @credentials.class != @credential_type
                raise("Need credential type is #{@credential_type}, actually is #{@credentials.class}.")
            end
            client = @client_class.new() \
                .with_endpoint(@endpoint) \
                .with_credentials(@credentials) \
                .with_config(@config) \
                .with_http_handler(@http_handler)
            
            client.add_file_logger(@file_logger_handler) if @file_logger_handler
            client.add_stream_logger(@stream_logger_handler) if @stream_logger_handler

            client.init_http_client()
            return client
        end

        def get_credential_from_environment_variables
            ak = ENV["HUAWEICLOUD_SDK_AK"]
            sk = ENV["HUAWEICLOUD_SDK_SK"]
            project_id = ENV["HUAWEICLOUD_SDK_PROJECT_ID"]
            domain_id = ENV["HUAWEICLOUD_SDK_DOMAIN_ID"]

            if @credential_type == BasicCredentials
                return BasicCredentials.new(ak, sk, project_id)
            elsif @credential_type == GlobalCredentials
                return GlobalCredentials.new(ak, sk, domain_id)
            else
                return nil
            end
        end
    end

    class Client
        attr_accessor :logger, :credentials, :endpoint, :config
        def initialize
            @preset_headers = {}
            @agent = {"User-Agent": "huaweicloud-usdk-ruby"}
            @logger = self.init_logger()
            @credentials = nil
            @config = nil
            @endpoint = nil

            @http_client = nil
            @http_handler = nil

            @model_package = nil
        end

        def self.init_logger
            logger_name = "HuaweiCloud-SDK-#{self.to_s}"
            logger = Logging.logger[logger_name]
            return logger
        end

        def logger
            @logger
        end

        def with_config(config)
            @config = config
            self
        end

        def with_credentials(credentials)
            @credentials = credentials
            self
        end

        def with_endpoint(endpoint)
            @endpoint = endpoint
            self
        end

        def with_http_handler(http_handler)
            @http_handler = http_handler ? http_handler : HuaweiCloudSDKCore::HTTP::HttpHandler.new
            self
        end

        def init_http_client
            @http_client = HuaweiCloudSDKCore::HTTP::HttpClient.new(@config, @http_handler, @logger)
        end

        def add_stream_logger(stream_logger_handler)
            Logging.color_scheme( 'bright',
                :levels => {
                  :info  => :green,
                  :warn  => :yellow,
                  :error => :red,
                  :fatal => [:white, :on_red]
                },
                :date => :blue,
                :logger => :cyan,
                :message => :magenta
              )
            if stream_logger_handler["stream"] == STDOUT or stream_logger_handler["stream"] == "stdout"
                Logging.appenders.stdout(
                    'stdout',
                    :level => stream_logger_handler["log_level"],
                    :layout => Logging.layouts.pattern(
                        :pattern => stream_logger_handler["format_string"] ? stream_logger_handler["format_string"] : '%d %t %c %F %L %l %m\n',
                        :date_pattern  =>  "%Y-%m-%d %H:%M:%S %z",
                        :color_scheme => 'bright'
                    )
                )
                @logger.add_appenders('stdout')
            else
                Logging.appenders.stderr(
                    'stderr',
                    :level => stream_logger_handler["log_level"],
                    :layout => Logging.layouts.pattern(
                        :pattern => stream_logger_handler["format_string"] ? stream_logger_handler["format_string"] : '%d %t %c %F %L %l %m\n',
                        :date_pattern  =>  "%Y-%m-%d %H:%M:%S %z",
                        :color_scheme => 'bright'
                    )
                )
                @logger.add_appenders('stderr')
            end
        end

        def add_file_logger(file_logger_handler)
            @logger.add_appenders(
                Logging.appenders.file(
                    file_logger_handler["path"],
                    :level => file_logger_handler["log_level"],
                    :layout => Logging.layouts.pattern(
                        :pattern => file_logger_handler["format_string"] ? file_logger_handler["format_string"] : '%d %t %c %F %L %l %m\n',
                        :date_pattern  =>  "%Y-%m-%d %H:%M:%S %z"
                    )
                )
            )
        end

        def get_agent
            return @agent
        end

        def get_credentials
            return @credentials
        end

        def get_http_client
            return @http_client
        end

        def _parse_header_params(collection_formats, header_params)
            header_params = Client.post_process_params(header_params) || {}
            header_params.update(@preset_headers||{})
            header_params.update(@agent||{})
            return header_params 
        end

        def _parse_path_params(collection_formats, path_params, resource_path, update_path_params)
            path_params = Client.post_process_params(path_params) || {}
            if update_path_params
                path_params.update(update_path_params)
            end
            if path_params
                path_params.each do |k,v|
                    resource_path = resource_path.gsub("{%{k}}", URI.encode_www_form_component(v.to_s))
                end
            end
            return resource_path
        end

        def _parse_query_params(collection_formats, query_params)
            query_params = Client.post_process_params(query_params) || []
            return query_params
        end

        def _parse_post_params(collection_formats, post_params)
            post_params = post_params ? Client.post_process_params(post_params) : {}
            return post_params
        end

        def _parse_body(body, post_params)
            if body
                return body if body.class == Hash || body.class == String
                body = body.to_json
            elsif post_params.size != 0
                body = post_params
            else
                body = ""
            end
            return body
        end

        def _is_stream(response_type)
            if response_type.class == String and @model_package.respond_to?(response_type)
                klass = @model_package.send(response_type)
                return true if klass.kind_of?(SdkStreamResponse)
            end
            return false
        end

        def Client.post_process_params(params)
            if params.class == Hash
                params.keys.each do |key|
                    unless params[key]
                        params.delete(key)
                    end
                end
                return params
            elsif params.class == Array
                return  params.select{|item| item.class==Array && item.size==2 && item[1]}
            end
        end

        def do_http_request(method, resource_path, path_params=nil, query_params=nil, header_params=nil,
            body=nil, post_params=nil, response_type=nil, collection_formats=nil, request_type=nil,
            async_request=false)
            url_parse_result = URI.parse(@endpoint)
            schema = url_parse_result.scheme
            host = url_parse_result.host
            header_params = _parse_header_params(collection_formats, header_params)
            resource_path = _parse_path_params(collection_formats, path_params, resource_path,
                @credentials.get_update_path_params())
            query_params = _parse_query_params(collection_formats, query_params)
            post_params = _parse_post_params(collection_formats, post_params)
            body = _parse_body(body, post_params)
            stream = _is_stream(response_type)
            sdk_request = SdkRequest.new(method, schema, host, resource_path, url_parse_result, query_params, header_params, body, stream)
            future_request = @credentials.process_auth_request(sdk_request, @http_client)
            if async_request
                executor = Concurrent::ThreadPoolExecutor.new(max_threads: 8)
                future_response = Concurrent::Future.execute(:executor => executor) do
                    response = _do_http_request_async(future_request, response_type)
                    response
                end
                return FutureSdkResponse.new(future_response, @logger)
            else
                request = future_request.value
                response = _do_http_request_sync(request)
                return response
            end
        end

        def _do_http_request_sync(request)
            response = @http_client.do_request_sync(request)
            return response
        end

        def _do_http_request_async(future_request, response_type)
            request = future_request.value
            future_response = @http_client.do_request_async(request)
            return future_response
        end
        
    end
end