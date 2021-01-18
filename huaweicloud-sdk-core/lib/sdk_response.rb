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
class SdkResponse
    attr_accessor :status_code, :header_params, :body
    def initialize
        @status_code = nil
        @header_params = nil
        @body = nil
    end
end

class FutureSdkResponse
    def initialize(response, logger)
        @future_response = response
        @logger = logger
    end

    def values
        response = @future_response.value.value
        return response.body, response.status, response.headers
    end
end