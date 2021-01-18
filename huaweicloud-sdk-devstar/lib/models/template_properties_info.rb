require 'date'

# module DevStar
  class TemplatePropertiesInfo
    # 模板的id
    attr_accessor :id

    # 模板的名称
    attr_accessor :title

    # 模板的描述信息
    attr_accessor :description

    # 模板关联的region host id
    attr_accessor :regionId

    # 模板关联的repo id
    attr_accessor :repostoryId

    # 模板https下载路径
    attr_accessor :codeUrl

    # 模板ssh下载路径
    attr_accessor :sshUrl

    # 项目id
    attr_accessor :projectUuid

    # 模板状态
    attr_accessor :status

    attr_accessor :properties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :id => :'id',
        :title => :'title',
        :description => :'description',
        :regionId => :'region_id',
        :repostoryId => :'repostory_id',
        :codeUrl => :'code_url',
        :sshUrl => :'ssh_url',
        :projectUuid => :'project_uuid',
        :status => :'status',
        :properties => :'properties'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :id => 'String',
        :title => 'String',
        :description => 'String',
        :regionId => 'String',
        :repostoryId => 'String',
        :codeUrl => 'String',
        :sshUrl => 'String',
        :projectUuid => 'String',
        :status => 'Integer',
        :properties => 'Array<PropertiesInfo>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DevStar::TemplatePropertiesInfo` initialize method"
      end

      

      if attributes.key?('id')
        self.id = attributes['id']
      end

      if attributes.key?('title')
        self.title = attributes['title']
      end

      if attributes.key?('description')
        self.description = attributes['description']
      end

      if attributes.key?('region_id')
        self.regionId = attributes['region_id']
      end

      if attributes.key?('repostory_id')
        self.repostoryId = attributes['repostory_id']
      end

      if attributes.key?('code_url')
        self.codeUrl = attributes['code_url']
      end

      if attributes.key?('ssh_url')
        self.sshUrl = attributes['ssh_url']
      end

      if attributes.key?('project_uuid')
        self.projectUuid = attributes['project_uuid']
      end

      if attributes.key?('status')
        self.status = attributes['status']
      end

      if attributes.key?('properties')
        if (value = attributes['properties']).is_a?(Array)
          self.properties = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@id.empty? && @id.to_s.length > 32
        invalid_properties.push('invalid value for "id", the character length must be smaller than or equal to 32.')
      end

      if !@id.empty? && @id.to_s.length < 32
        invalid_properties.push('invalid value for "id", the character length must be great than or equal to 32.')
      end

      if !@title.empty? && @title.to_s.length > 100
        invalid_properties.push('invalid value for "title", the character length must be smaller than or equal to 100.')
      end

      if !@title.empty? && @title.to_s.length < 1
        invalid_properties.push('invalid value for "title", the character length must be great than or equal to 1.')
      end

      if !@description.empty? && @description.to_s.length > 1024
        invalid_properties.push('invalid value for "description", the character length must be smaller than or equal to 1024.')
      end

      if !@description.empty? && @description.to_s.length < 1
        invalid_properties.push('invalid value for "description", the character length must be great than or equal to 1.')
      end

      if !@regionId.empty? && @regionId.to_s.length > 1024
        invalid_properties.push('invalid value for "regionId", the character length must be smaller than or equal to 1024.')
      end

      if !@regionId.empty? && @regionId.to_s.length < 1
        invalid_properties.push('invalid value for "regionId", the character length must be great than or equal to 1.')
      end

      if !@repostoryId.empty? && @repostoryId.to_s.length > 1024
        invalid_properties.push('invalid value for "repostoryId", the character length must be smaller than or equal to 1024.')
      end

      if !@repostoryId.empty? && @repostoryId.to_s.length < 1
        invalid_properties.push('invalid value for "repostoryId", the character length must be great than or equal to 1.')
      end

      if !@codeUrl.empty? && @codeUrl.to_s.length > 1024
        invalid_properties.push('invalid value for "codeUrl", the character length must be smaller than or equal to 1024.')
      end

      if !@codeUrl.empty? && @codeUrl.to_s.length < 1
        invalid_properties.push('invalid value for "codeUrl", the character length must be great than or equal to 1.')
      end

      if !@sshUrl.empty? && @sshUrl.to_s.length > 1024
        invalid_properties.push('invalid value for "sshUrl", the character length must be smaller than or equal to 1024.')
      end

      if !@sshUrl.empty? && @sshUrl.to_s.length < 1
        invalid_properties.push('invalid value for "sshUrl", the character length must be great than or equal to 1.')
      end

      if !@projectUuid.empty? && @projectUuid.to_s.length > 256
        invalid_properties.push('invalid value for "projectUuid", the character length must be smaller than or equal to 256.')
      end

      if !@projectUuid.empty? && @projectUuid.to_s.length < 1
        invalid_properties.push('invalid value for "projectUuid", the character length must be great than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@id.empty? && @id.to_s.length > 32
      return false if !@id.empty? && @id.to_s.length < 32
      return false if !@title.empty? && @title.to_s.length > 100
      return false if !@title.empty? && @title.to_s.length < 1
      return false if !@description.empty? && @description.to_s.length > 1024
      return false if !@description.empty? && @description.to_s.length < 1
      return false if !@regionId.empty? && @regionId.to_s.length > 1024
      return false if !@regionId.empty? && @regionId.to_s.length < 1
      return false if !@repostoryId.empty? && @repostoryId.to_s.length > 1024
      return false if !@repostoryId.empty? && @repostoryId.to_s.length < 1
      return false if !@codeUrl.empty? && @codeUrl.to_s.length > 1024
      return false if !@codeUrl.empty? && @codeUrl.to_s.length < 1
      return false if !@sshUrl.empty? && @sshUrl.to_s.length > 1024
      return false if !@sshUrl.empty? && @sshUrl.to_s.length < 1
      return false if !@projectUuid.empty? && @projectUuid.to_s.length > 256
      return false if !@projectUuid.empty? && @projectUuid.to_s.length < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] id Value to be assigned
    def id=(id)
      if !id.empty? && id.to_s.length > 32
        fail ArgumentError, 'invalid value for "id", the character length must be smaller than or equal to 32.'
      end

      if !id.empty? && id.to_s.length < 32
        fail ArgumentError, 'invalid value for "id", the character length must be great than or equal to 32.'
      end

      @id = id
    end

    # Custom attribute writer method with validation
    # @param [Object] title Value to be assigned
    def title=(title)
      if !title.empty? && title.to_s.length > 100
        fail ArgumentError, 'invalid value for "title", the character length must be smaller than or equal to 100.'
      end

      if !title.empty? && title.to_s.length < 1
        fail ArgumentError, 'invalid value for "title", the character length must be great than or equal to 1.'
      end

      @title = title
    end

    # Custom attribute writer method with validation
    # @param [Object] description Value to be assigned
    def description=(description)
      if !description.empty? && description.to_s.length > 1024
        fail ArgumentError, 'invalid value for "description", the character length must be smaller than or equal to 1024.'
      end

      if !description.empty? && description.to_s.length < 1
        fail ArgumentError, 'invalid value for "description", the character length must be great than or equal to 1.'
      end

      @description = description
    end

    # Custom attribute writer method with validation
    # @param [Object] regionId Value to be assigned
    def regionId=(regionId)
      if !regionId.empty? && regionId.to_s.length > 1024
        fail ArgumentError, 'invalid value for "regionId", the character length must be smaller than or equal to 1024.'
      end

      if !regionId.empty? && regionId.to_s.length < 1
        fail ArgumentError, 'invalid value for "regionId", the character length must be great than or equal to 1.'
      end

      @regionId = regionId
    end

    # Custom attribute writer method with validation
    # @param [Object] repostoryId Value to be assigned
    def repostoryId=(repostoryId)
      if !repostoryId.empty? && repostoryId.to_s.length > 1024
        fail ArgumentError, 'invalid value for "repostoryId", the character length must be smaller than or equal to 1024.'
      end

      if !repostoryId.empty? && repostoryId.to_s.length < 1
        fail ArgumentError, 'invalid value for "repostoryId", the character length must be great than or equal to 1.'
      end

      @repostoryId = repostoryId
    end

    # Custom attribute writer method with validation
    # @param [Object] codeUrl Value to be assigned
    def codeUrl=(codeUrl)
      if !codeUrl.empty? && codeUrl.to_s.length > 1024
        fail ArgumentError, 'invalid value for "codeUrl", the character length must be smaller than or equal to 1024.'
      end

      if !codeUrl.empty? && codeUrl.to_s.length < 1
        fail ArgumentError, 'invalid value for "codeUrl", the character length must be great than or equal to 1.'
      end

      @codeUrl = codeUrl
    end

    # Custom attribute writer method with validation
    # @param [Object] sshUrl Value to be assigned
    def sshUrl=(sshUrl)
      if !sshUrl.empty? && sshUrl.to_s.length > 1024
        fail ArgumentError, 'invalid value for "sshUrl", the character length must be smaller than or equal to 1024.'
      end

      if !sshUrl.empty? && sshUrl.to_s.length < 1
        fail ArgumentError, 'invalid value for "sshUrl", the character length must be great than or equal to 1.'
      end

      @sshUrl = sshUrl
    end

    # Custom attribute writer method with validation
    # @param [Object] projectUuid Value to be assigned
    def projectUuid=(projectUuid)
      if !projectUuid.empty? && projectUuid.to_s.length > 256
        fail ArgumentError, 'invalid value for "projectUuid", the character length must be smaller than or equal to 256.'
      end

      if !projectUuid.empty? && projectUuid.to_s.length < 1
        fail ArgumentError, 'invalid value for "projectUuid", the character length must be great than or equal to 1.'
      end

      @projectUuid = projectUuid
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          title == o.title &&
          description == o.description &&
          regionId == o.regionId &&
          repostoryId == o.repostoryId &&
          codeUrl == o.codeUrl &&
          sshUrl == o.sshUrl &&
          projectUuid == o.projectUuid &&
          status == o.status &&
          properties == o.properties
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, title, description, regionId, repostoryId, codeUrl, sshUrl, projectUuid, status, properties].hash
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
