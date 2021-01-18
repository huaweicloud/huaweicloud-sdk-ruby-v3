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
require "concurrent"

module HuaweiCloudSDKCore
    class Credentials
        def get_update_path_params
        end
        def process_auth_request(request, http_client)
        end
    end
    class BasicCredentials < Credentials
        attr_accessor :ak, :sk, :project_id
        def initialize(ak, sk, project_id)
            raise ApiValueError.new("AK can not be null.") if !ak or ak == ""
            raise ApiValueError.new("SK can not be null.") if !sk or sk == ""
            @ak = ak
            @sk = sk
            @project_id = project_id
        end

        def get_update_path_params
            path_params = {}
            if @project_id
                path_params["project_id"] = @project_id
            end
            return path_params
        end

        def process_auth_request(request, http_client)
            Concurrent::Promises.future{sign_request(request)}
        end

        def sign_request(request)
            if @project_id
                request.header_params["X-Project-Id"] = @project_id
            end

            if request.header_params.include?("Content-Type") and request.header_params["Content-Type"].start_with?("application/json")
                request.header_params["X-Sdk-Content-Sha256"] = "UNSIGNED-PAYLOAD"
            end
            return Signer.new(self).sign(request)
        end
    end
    class GlobalCredentials < Credentials
        attr_accessor :ak, :sk, :domain_id
        def initialize(ak, sk, domain_id)
            raise ApiValueError.new("AK can not be null.") if !ak or ak == ""
            raise ApiValueError.new("SK can not be null.") if !sk or sk == ""
            @ak = ak
            @sk = sk
            @domain_id = domain_id
        end

        def get_update_path_params
            path_params = {}
            if @domain_id
                path_params["domain_id"] = @domain_id
            end
            return path_params
        end

        def process_auth_request(request, http_client)
            Concurrent::Promises.future{sign_request(request)}
        end

        def sign_request(request)
            if @domain_id
                request.header_params["X-Domain-Id"] = @domain_id
            end

            if request.header_params.include?("Content-Type") and request.header_params["Content-Type"].start_with?("application/json")
                request.header_params["X-Sdk-Content-Sha256"] = "UNSIGNED-PAYLOAD"
            end    
            return Signer.new(self).sign(request)
        end
    end
end