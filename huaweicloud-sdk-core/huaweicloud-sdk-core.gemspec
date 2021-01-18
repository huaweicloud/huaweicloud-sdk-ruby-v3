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
Gem::Specification.new do |s|
    s.name        = "huaweicloudsdkcore"
    s.version     = "0.0.1-alpha"
    s.date        = "2020-12-31"
    s.summary     = "huaweicloud-sdk-core"
    s.description = "Huawei Cloud SDK Core"
    s.authors     = ["HuaweiCloud SDK"]
    s.email       = ["hwcloudsdk@huawei.com"]
    s.files       = [
        "lib/huaweicloudsdkcore.rb",
        "lib/exceptions.rb",
        "lib/sdk_request.rb",
        "lib/sdk_response.rb",
        "lib/client.rb",
        "lib/signer.rb",
        "lib/http/http_config.rb",
        "lib/http/http_client.rb",
        "lib/http/http_handler.rb",
        "lib/auth/credentials.rb"
    ]
    s.homepage    =
      "https://github.com/huaweicloud/huaweicloud-sdk-ruby-v3"
    s.license       = "Apache-2.0"
    s.add_dependency "logging", "~> 2.3"
    s.add_dependency "faraday", "~> 1.1"
    s.add_dependency "net-http-persistent", "~> 4.0.0"
    s.add_dependency "concurrent-ruby", "~> 1.1.7"
  end
