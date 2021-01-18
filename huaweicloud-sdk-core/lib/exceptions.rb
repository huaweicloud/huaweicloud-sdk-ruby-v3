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

def render_path(path_to_item)
    result = ""
    path_to_item.each do |pth|
        if pth.is_a?(Integer)
            result += "[#{pth}]"
        else
            result += "['#{pth}']"
        end
    end
    return result
end

module HuaweiCloudSDKCore
    class SdkException < Exception
        attr_accessor :err_message
        def initialize(err_message)
            @err_message = err_message
        end
    end

    class ConnectionException < SdkException
    end

    class HostUnreachableException <ConnectionException
    end

    class SslHandShakeException < ConnectionException
    end

    class ApiTypeError < TypeError
        attr_accessor :path_to_item, :valid_classes, :key_type
        def initialize(msg, path_to_item=nil, valid_classes=nil, key_type=nil)
            @path_to_item = path_to_item
            @valid_classes = valid_classes
            @key_type = key_type
            full_msg = msg
            full_msg = "#{msg} at #{render_path(@path_to_item)}" if @path_to_item
            super(full_msg)
        end
    end

    class ApiValueError < Exception
        attr_accessor :path_to_item
        def initialize(msg, path_to_item=nil)
            @path_to_item = path_to_item
            full_msg = msg
            full_msg = "#{msg} at #{render_path(@path_to_item)}" if @path_to_item
            super(full_msg)
        end
    end

    class ApiKeyError <KeyError
        attr_accessor :path_to_item
        def initialize(msg, path_to_item=nil)            
            @path_to_item = path_to_item
            full_msg = msg
            full_msg = "#{msg} at #{render_path(@path_to_item)}" if @path_to_item
            super(full_msg)
        end
    end
    
    class ServiceResponseException < SdkException
        attr_accessor :status_code, :error_msg, :error_code, :request_id
        def initialize(status_code, sdk_error)
            @status_code = status_code
            @error_msg = sdk_error.error_msg
            @error_code = sdk_error.error_code
            @request_id = sdk_error.request_id
        end
    end

    class ClientRequestException < ServiceResponseException
    end

    class ServerResponseException < ServiceResponseException
    end

    class RequestTimeoutException < SdkException        
    end

    class CallTimeoutException < RequestTimeoutException
    end

    class RetryOutageException < RequestTimeoutException
    end

    class SdkError
        attr_accessor :request_id, :error_code, :error_msg
        def initialize(request_id=nil, error_code=nil, error_msg=nil)
            @error_msg = error_msg
            @error_code = error_code
            @request_id = request_id
        end
    end
end