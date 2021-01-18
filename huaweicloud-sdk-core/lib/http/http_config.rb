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

module HuaweiCloudSDKCore
    module HTTP
        class HTTPConfig

            attr_accessor :proxy_protocol, :proxy_host, :proxy_port, :proxy_user, :proxy_password
            attr_accessor :ignore_ssl_verification, :ssl_ca_cert, :cert_file
            attr_accessor :key_file, :timeout, :retry_times, :pool_connections, :pool_maxsize
            attr_accessor :async
            
            def initialize(proxy_protocol=nil, proxy_host=nil, proxy_port=nil, proxy_user=nil, proxy_password=nil,
                ignore_ssl_verification=false, ssl_ca_cert=nil, cert_file=nil, key_file=nil, timeout=60,
                retry_times=0, pool_connections=1, pool_maxsize=1)
                @proxy_protocol = proxy_protocol
                @proxy_host = proxy_host
                @proxy_port = proxy_port
                @proxy_user = proxy_user
                @proxy_password = proxy_password
        
                @ignore_ssl_verification = ignore_ssl_verification
        
                @ssl_ca_cert = ssl_ca_cert
                @cert_file = cert_file
                @key_file = key_file
        
                @timeout = timeout
                @retry_times = retry_times
                @pool_connections = pool_connections
                @pool_maxsize = pool_maxsize
            end
            
            def get_proxy
                unless @proxy_host
                    return nil
                else
                    return {
                        "https": "#{@proxy_protocol}://#{@proxy_user?@proxy_user+":"+@proxy_password+"@":""}#{@proxy_host}#{@proxy_port?":#{@proxy_port}":""}"
                    }
                end
            end
        
            def self.get_default_config
                self.new
            end
        end
    end
end