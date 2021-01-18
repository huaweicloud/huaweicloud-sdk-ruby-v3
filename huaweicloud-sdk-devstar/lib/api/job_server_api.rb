require 'cgi'

module DevStar
  class JobServerApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # CodeHub 模板生成代码
    # 通过 Codehub 的模板进行应用代码创建  通过 Codehub 模板创建生成应用代码的任务，并将应用代码存储于指定的 CodeHub 仓库中或者生成代码压缩包，可以通过返回的任务 ID 查询相关任务状态  - 接口鉴权方式 通过华为云服务获取的用户token  - 代码生成位置 应用代码生成后的地址，目前支持codehub地址和压缩包下载地址。
    # @param run_codehub_template_job_request_body [CodehubJobInfo] 创建任务参数
    # @param [Hash] opts the optional parameters
    # @option opts [String] :x_language 语言类型 中文:zh-cn 英文:en-us (default to 'zh-cn')
    # @return [JobResp]
    def run_codehub_template_job(request = {})
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
      return_type = opts[:return_type] || 'JobResp' 

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
      local_var_path = '/v1/jobs/codehub'
      
      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      return data, status_code, headers
    end
    # Devstar 模板生成代码
    # 通过DevStar的模板进行应用代码创建  通过 DevStar 模板创建生成应用代码的任务，并将应用代码存储于指定的 CodeHub 仓库中，可以通过返回的任务 ID 查询相关任务状态  - 接口鉴权方式 通过华为云服务获取的用户token  - 代码生成位置 应用代码生成后的地址，目前支持codehub地址和压缩包下载地址。
    # @param run_devstar_template_job_request_body [TemplateJobInfo] 创建任务参数
    # @param [Hash] opts the optional parameters
    # @option opts [String] :x_language 语言类型 中文:zh-cn 英文:en-us (default to 'zh-cn')
    # @return [JobResp]
    def run_devstar_template_job(request = {})
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
      return_type = opts[:return_type] || 'JobResp' 

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
      local_var_path = '/v1/jobs/template'
      
      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      return data, status_code, headers
    end
    # 查询任务详情
    # 查询任务的详情  通过任务ID可以查看任务的状态 当任务结束时返回应用代码存放的位置  - 接口鉴权方式 通过华为云服务获取的用户token  - 代码生成位置 应用代码生成后的地址，目前支持codehub地址和压缩包下载地址
    # @param job_id [String] 任务id
    # @param [Hash] opts the optional parameters
    # @option opts [String] :x_language 语言类型 中文:zh-cn 英文:en-us (default to 'zh-cn')
    # @return [Job]
    def show_job_detail(request = {})
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
      return_type = opts[:return_type] || 'Job' 

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
      local_var_path = '/v1/jobs/{job_id}'.sub('{' + 'job_id' + '}', CGI.escape(local_var_params[all_keys[:job_id]].to_s))
      
      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      return data, status_code, headers
    end
  end
end
