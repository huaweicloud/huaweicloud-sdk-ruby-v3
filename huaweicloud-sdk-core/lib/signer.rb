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
require 'openssl'
require 'digest'
require 'open-uri'

EncodeUtf8 = "utf-8"
BasicDateFormat = "%Y%m%dT%H%M%SZ"
Algorithm = "SDK-HMAC-SHA256"
HeaderXDate = "X-Sdk-Date"
HeaderHost = "Host"
HeaderAuthorization = "Authorization"
HeaderContentSha256 = "X-Sdk-Content-Sha256"

def hmac_sha256(key_byte, message)
    digest = OpenSSL::Digest.new('sha256')
    OpenSSL::HMAC.digest(digest, key_byte.encode(EncodeUtf8), message.encode(EncodeUtf8))    
end

def process_string_to_sign(canonical_request, time)
    "#{Algorithm}\n#{time.strftime(BasicDateFormat)}\n#{hex_encode_sha256_hash(canonical_request.encode(EncodeUtf8))}"
end

def url_encode(s)
    URI.encode_www_form_component(s)
end

def find_header(r, header)
    r.header_params.each do |k,v|
        return v if k.downcase == header.downcase
    end
    return nil
end

def hex_encode_sha256_hash(data)
    Digest::SHA256.hexdigest data
end

def process_canonical_request(request, signed_headers)
    canonical_headers = process_canonical_headers(request.header_params, signed_headers)
    hex_encode = find_header(request, HeaderContentSha256)
    hex_encode = hex_encode_sha256_hash(request.body) unless hex_encode
    canonical_uri = process_canonical_uri(request)
    canonical_query_string = process_canonical_query_string(request)
    return "#{request.method.upcase}\n" \
            + "#{canonical_uri}\n" \
            + "#{canonical_query_string}\n" \
            + "#{canonical_headers}\n" \
            + "#{signed_headers.join(";")}\n" \
            + "#{hex_encode}"
end

def process_canonical_uri(request)
    pattens = URI.decode_www_form_component(request.resource_path).split('/')
    uri = []
    pattens.each do |v|
        uri << url_encode(v)
    end
    url_path = uri.join("/")
    if url_path[-1] != '/'
        url_path = url_path + "/"
    end
    return url_path
end

def process_canonical_query_string(request)    
    params = request.query_params.sort
    canonical_query_param = []
    params.each do |key, value|
        k = url_encode(key)        
        if value.class == Array            
            value.sort.each do |v|
                kv = k + "=" + url_encode(v.to_s)
                canonical_query_param << kv
            end
        else
            kv = k + "=" + url_encode(value.to_s)
            canonical_query_param << kv
        end
    end
    return canonical_query_param.join('&')
end

def process_canonical_headers(header_params, signed_headers)
    canonical_headers = []
    __headers = {}
    header_params.each_key do |key|
        key_encoded = key.downcase
        value = header_params[key]
        value_encoded = value.strip
        __headers[key_encoded] = value_encoded
        header_params[key] = value_encoded.encode(EncodeUtf8).force_encoding('iso-8859-1')
    end

    signed_headers.each do |key|
        canonical_headers << "#{key}:#{__headers[key]}"
    end

    return canonical_headers.join("\n") + "\n"
end

def process_signed_headers(header_params)
    signed_headers = []
    header_params.each_key do |key|
        signed_headers << key.downcase
    end    
    return signed_headers.sort
end

def sign_string_to_sign(string_to_sign, key)
    digest = OpenSSL::Digest.new('sha256')
    OpenSSL::HMAC.hexdigest(digest, key.encode(EncodeUtf8), string_to_sign.encode(EncodeUtf8))
end

def process_auth_header_value(signature, app_key, signed_headers)
    "#{Algorithm} Access=#{app_key}, SignedHeaders=#{signed_headers.join(";")}, Signature=#{signature}"
end

class Signer
    def initialize(credentials)
        @ak = credentials.ak
        @sk = credentials.sk
    end

    def sign(request)
        request.body = request.body.encode(EncodeUtf8)
        header_time = find_header(request, HeaderXDate)
        unless header_time
            t = Time.now.utc
            request.header_params[HeaderXDate] = t.strftime(BasicDateFormat)
        else
            t = DateTime.strptime(header_time, BasicDateFormat)
        end

        has_host_header = false
        request.header_params.each_key do |key|
            if key.downcase=="host"
                has_host_header = true
                break
            end
        end
        request.header_params["Host"] = request.host unless has_host_header

        signed_headers = process_signed_headers(request.header_params)
        canonical_request = process_canonical_request(request, signed_headers)
        string_to_sign = process_string_to_sign(canonical_request, t)
        signature = sign_string_to_sign(string_to_sign, @sk)
        auth_value = process_auth_header_value(signature, @ak, signed_headers)
        request.header_params[HeaderAuthorization] = auth_value
        canonical_query_string = process_canonical_query_string(request)
        request.uri = canonical_query_string ?  "#{request.resource_path}?#{canonical_query_string}" : request.resource_path
        return request
    end
end