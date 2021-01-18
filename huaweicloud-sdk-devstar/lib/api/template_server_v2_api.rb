require 'cgi'

module DevStar
  class TemplateServerV2Api
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # 查询模板列表
    # 查询模板列表
    # @param action_id [String] query(查询)
    # @param [Hash] opts the optional parameters
    # @option opts [String] :x_language 语言类型 中文:zh-cn 英文:en-us (default to 'zh-cn')
    # @option opts [TemplateQueryV2] :list_templates_v2_request_body 模板列表查询参数
    # @return [TemplateQueryResp]
    def list_templates_v2(request = {})
      opts = {}
      query_params = {}
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=UTF-8'])
      form_params = {}

      if request.class.respond_to?(:attribute_map)
        all_params = request.class.attribute_map.keys
        local_var_params = {}
        all_params.each do |key|
          local_var_params[key] = request.send(key) if request.respond_to?(key)
        end
        all_keys = {}
        all_params.each do |key|
          all_keys[request.class.attribute_map[key]]=key
        end

        # query parameters
        if local_var_params.include?(all_keys[:'action_id'])
          query_params["action_id"]=local_var_params[all_keys[:'action_id']]
        end

        # header parameters
        if local_var_params.include?(all_keys[:'X-Language'])
          header_params["X-Language"]=local_var_params[all_keys[:'X-Language']]
        end

        # form parameters
      end

      # http body (model)
      if request.respond_to?(:body)
        post_body = request.body.to_s.gsub("=>",":")
      else
        post_body = nil      
      end
      # return_type
      return_type = opts[:return_type] || 'TemplateQueryResp' 

      # auth_names
      auth_names = opts[:auth_names] || []

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      # resource path
      local_var_path = '/v2/templates/action'
      
      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      return data, status_code, headers
    end
  end
end
