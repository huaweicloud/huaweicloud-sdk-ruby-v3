require 'date'

# module DevStar
  class CodehubJobInfo
    # 应用名称
    attr_accessor :applicationName

    # 代码存放的ssh地址
    attr_accessor :codeUrl

    # CodeHub 仓库所在的 Region ID。华南-广州: cn-south-1, 华东-上海二：cn-east-2，华北-北京一： cn-north-1 ，华北-北京四：cn-north-4
    attr_accessor :regionId

    # 0 - 将生成的应用代码存储于 repo_info 指定的 CodeHub 仓库中。1 - 将生成的应用代码存储到华为云，任务创建人可以通过 ExportApplicationCode 下载代码压缩包
    attr_accessor :repoType

    # 可以根据 template-metadata.json 获取动态参数 ID 以及规则
    attr_accessor :properties

    attr_accessor :repoInfo

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :applicationName => :'application_name',
        :codeUrl => :'code_url',
        :regionId => :'region_id',
        :repoType => :'repo_type',
        :properties => :'properties',
        :repoInfo => :'repo_info'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :applicationName => 'String',
        :codeUrl => 'String',
        :regionId => 'String',
        :repoType => 'Integer',
        :properties => 'Hash<String, String>',
        :repoInfo => 'RepositoryInfo'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DevStar::CodehubJobInfo` initialize method"
      end

      

      if attributes.key?('application_name')
        self.applicationName = attributes['application_name']
      end

      if attributes.key?('code_url')
        self.codeUrl = attributes['code_url']
      end

      if attributes.key?('region_id')
        self.regionId = attributes['region_id']
      end

      if attributes.key?('repo_type')
        self.repoType = attributes['repo_type']
      end

      if attributes.key?('properties')
        if (value = attributes['properties']).is_a?(Hash)
          self.properties = value
        end
      end

      if attributes.key?('repo_info')
        self.repoInfo = attributes['repo_info']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @applicationName.nil?
        invalid_properties.push('invalid value for "applicationName", applicationName cannot be nil.')
      end

      if @applicationName.to_s.length > 100
        invalid_properties.push('invalid value for "applicationName", the character length must be smaller than or equal to 100.')
      end

      if @applicationName.to_s.length < 1
        invalid_properties.push('invalid value for "applicationName", the character length must be great than or equal to 1.')
      end

      if @codeUrl.nil?
        invalid_properties.push('invalid value for "codeUrl", codeUrl cannot be nil.')
      end

      if @codeUrl.to_s.length > 1024
        invalid_properties.push('invalid value for "codeUrl", the character length must be smaller than or equal to 1024.')
      end

      if @codeUrl.to_s.length < 1
        invalid_properties.push('invalid value for "codeUrl", the character length must be great than or equal to 1.')
      end

      if @regionId.nil?
        invalid_properties.push('invalid value for "regionId", regionId cannot be nil.')
      end

      if @regionId.to_s.length > 128
        invalid_properties.push('invalid value for "regionId", the character length must be smaller than or equal to 128.')
      end

      if @regionId.to_s.length < 1
        invalid_properties.push('invalid value for "regionId", the character length must be great than or equal to 1.')
      end

      if @repoType.nil?
        invalid_properties.push('invalid value for "repoType", repoType cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @applicationName.nil?
      return false if @applicationName.to_s.length > 100
      return false if @applicationName.to_s.length < 1
      return false if @codeUrl.nil?
      return false if @codeUrl.to_s.length > 1024
      return false if @codeUrl.to_s.length < 1
      return false if @regionId.nil?
      return false if @regionId.to_s.length > 128
      return false if @regionId.to_s.length < 1
      return false if @repoType.nil?
      repoType_validator = EnumAttributeValidator.new('Integer', [0, 1])
      return false unless repoType_validator.valid?(@repoType)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] applicationName Value to be assigned
    def applicationName=(applicationName)
      if applicationName.nil?
        fail ArgumentError, 'applicationName cannot be nil'
      end

      if applicationName.to_s.length > 100
        fail ArgumentError, 'invalid value for "applicationName", the character length must be smaller than or equal to 100.'
      end

      if applicationName.to_s.length < 1
        fail ArgumentError, 'invalid value for "applicationName", the character length must be great than or equal to 1.'
      end

      @applicationName = applicationName
    end

    # Custom attribute writer method with validation
    # @param [Object] codeUrl Value to be assigned
    def codeUrl=(codeUrl)
      if codeUrl.nil?
        fail ArgumentError, 'codeUrl cannot be nil'
      end

      if codeUrl.to_s.length > 1024
        fail ArgumentError, 'invalid value for "codeUrl", the character length must be smaller than or equal to 1024.'
      end

      if codeUrl.to_s.length < 1
        fail ArgumentError, 'invalid value for "codeUrl", the character length must be great than or equal to 1.'
      end

      @codeUrl = codeUrl
    end

    # Custom attribute writer method with validation
    # @param [Object] regionId Value to be assigned
    def regionId=(regionId)
      if regionId.nil?
        fail ArgumentError, 'regionId cannot be nil'
      end

      if regionId.to_s.length > 128
        fail ArgumentError, 'invalid value for "regionId", the character length must be smaller than or equal to 128.'
      end

      if regionId.to_s.length < 1
        fail ArgumentError, 'invalid value for "regionId", the character length must be great than or equal to 1.'
      end

      @regionId = regionId
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] repoType Object to be assigned
    def repoType=(repoType)
      validator = EnumAttributeValidator.new('Integer', [0, 1])
      unless validator.valid?(repoType)
        fail ArgumentError, "invalid value for \"repoType\", must be one of #{validator.allowable_values}."
      end
      @repoType = repoType
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          applicationName == o.applicationName &&
          codeUrl == o.codeUrl &&
          regionId == o.regionId &&
          repoType == o.repoType &&
          properties == o.properties &&
          repoInfo == o.repoInfo
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [applicationName, codeUrl, regionId, repoType, properties, repoInfo].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        DevStar.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param.to_s] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
# end
