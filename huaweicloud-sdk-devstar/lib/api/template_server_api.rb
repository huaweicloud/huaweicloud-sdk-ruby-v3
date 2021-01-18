require 'cgi'

module DevStar
  class TemplateServerApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # 生成模板浏览历史记录
    # 生成模板浏览记录 
    # @param create_template_view_histories_request_body [TemplatesInfo] 模板信息
    # @param [Hash] opts the optional parameters
    # @option opts [String] :x_language 语言类型 中文:zh-cn 英文:en-us (default to 'zh-cn')
    # @return [ListTemplateViewHistoriesResp]
    def create_template_view_histories(request = {})
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
      return_type = opts[:return_type] || 'ListTemplateViewHistoriesResp' 

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
      local_var_path = '/v1/templates/view-histories'
      
      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      return data, status_code, headers
    end
    # 查询模板列表
    # 查询模板列表
    # @param [Hash] opts the optional parameters
    # @option opts [String] :x_language 语言类型 中文:zh-cn 英文:en-us (default to 'zh-cn')
    # @option opts [String] :keyword 搜索关键字,支持按名称和描述搜索，默认null
    # @option opts [Integer] :offset 偏移量, 表示从此偏移量开始查询, offset大于等于0 (default to 0)
    # @option opts [Integer] :limit 每页的模板条数, 默认10 (default to 10)
    # @return [TemplateSimpleInfoResp]
    def list_published_templates(request = {})
      opts = {}
      query_params = {}
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type([])
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
        if local_var_params.include?(all_keys[:'keyword'])
          query_params["keyword"]=local_var_params[all_keys[:'keyword']]
        end
        if local_var_params.include?(all_keys[:'offset'])
          query_params["offset"]=local_var_params[all_keys[:'offset']]
        end
        if local_var_params.include?(all_keys[:'limit'])
          query_params["limit"]=local_var_params[all_keys[:'limit']]
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
      return_type = opts[:return_type] || 'TemplateSimpleInfoResp' 

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
      local_var_path = '/v1/templates'
      
      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      return data, status_code, headers
    end
    # 我浏览的模板记录
    # 查询用户浏览过的模板(只返回最近浏览的5个模板) 
    # @param platform_source [Integer] 平台来源（0:codelabs、1:devstar）
    # @param [Hash] opts the optional parameters
    # @option opts [String] :x_language 语言类型 中文:zh-cn 英文:en-us (default to 'zh-cn')
    # @return [ListTemplateViewHistoriesResp]
    def list_template_view_histories(request = {})
      opts = {}
      query_params = {}
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type([])
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
        if local_var_params.include?(all_keys[:'platform_source'])
          query_params["platform_source"]=local_var_params[all_keys[:'platform_source']]
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
      return_type = opts[:return_type] || 'ListTemplateViewHistoriesResp' 

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
      local_var_path = '/v1/templates/view-histories'
      
      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      return data, status_code, headers
    end
  end
end
