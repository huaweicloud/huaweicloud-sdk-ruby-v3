# Common files
require 'api_client'
require 'api_error'
require 'configuration'
require 'version'

# Models
require 'models/codehub_job_info'
require 'models/create_template_view_histories_request'
require 'models/create_template_view_histories_response'
require 'models/download_application_code_request'
require 'models/download_application_code_response'
require 'models/job'
require 'models/job_resp'
require 'models/list_published_templates_request'
require 'models/list_published_templates_response'
require 'models/list_template_view_histories_request'
require 'models/list_template_view_histories_resp'
require 'models/list_template_view_histories_response'
require 'models/list_templates_v2_request'
require 'models/list_templates_v2_response'
require 'models/pipeline_template_info'
require 'models/properties_info'
require 'models/reference'
require 'models/repository_info'
require 'models/run_codehub_template_job_request'
require 'models/run_codehub_template_job_response'
require 'models/run_devstar_template_job_request'
require 'models/run_devstar_template_job_response'
require 'models/show_job_detail_request'
require 'models/show_job_detail_response'
require 'models/show_template_detail_request'
require 'models/show_template_detail_response'
require 'models/show_template_file_request'
require 'models/show_template_file_response'
require 'models/show_template_v3_request'
require 'models/show_template_v3_response'
require 'models/tag_info'
require 'models/template_detail'
require 'models/template_file'
require 'models/template_info'
require 'models/template_job_info'
require 'models/template_product_ext'
require 'models/template_properties_info'
require 'models/template_query_resp'
require 'models/template_query_v2'
require 'models/template_simple_info'
require 'models/template_simple_info_resp'
require 'models/template_view_history'
require 'models/templates_info'
require 'models/topic_category'

# APIs
require 'api/application_service_api'
require 'api/job_server_api'
require 'api/template_efs_server_api'
require 'api/template_server_api'
require 'api/template_server_v2_api'
require 'api/template_server_v3_api'
require 'api/template_service_api'

module DevStar
  class << self
    # Customize default settings for the SDK using block.
    #   DevStar.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
