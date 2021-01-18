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

def default_request_handler(obj=nil)
end

def default_response_handler(obj=nil)
    if obj
        _response = obj[:response]
        log_info = "\"#{_response.env.method}" \
                + " #{_response.env.url}\"" \
                + " #{_response.status}" \
                + " #{_response.body.size}" \
                + " #{_response.headers.include?("X-Request-Id") ? _response.headers["X-Request-Id"] : ""}"
        obj[:logger].info(log_info) if obj[:logger]
    end
end

module HuaweiCloudSDKCore
    module HTTP
        class HttpHandler
            def initialize
                @request_handlers = [:default_request_handler]
                @response_handlers = [:default_response_handler]
            end

            def add_request_handler(handler)
                @request_handlers << handler
                self
            end

            def add_response_handler(handler)
                @response_handlers << handler
                self
            end

            def process_request(obj)
                @request_handlers.each {|handler| method(handler).call(obj) if handler} 
            end

            def process_response(obj)
                @response_handlers.each {|handler| method(handler).call(obj) if handler} 
            end
        end
    end
end