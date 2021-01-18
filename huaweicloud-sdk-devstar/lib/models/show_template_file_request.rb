require 'date'

# module DevStar
  class ShowTemplateFileRequest
    attr_accessor :xLanguage

    attr_accessor :templateId

    attr_accessor :filePath

    attr_accessor :type

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
        :xLanguage => :'X-Language',
        :templateId => :'template_id',
        :filePath => :'file_path',
        :type => :'type'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :xLanguage => 'String',
        :templateId => 'String',
        :filePath => 'String',
        :type => 'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DevStar::ShowTemplateFileRequest` initialize method"
      end

      

      if attributes.key?('X-Language')
        self.xLanguage = attributes['X-Language']
      end

      if attributes.key?('template_id')
        self.templateId = attributes['template_id']
      end

      if attributes.key?('file_path')
        self.filePath = attributes['file_path']
      end

      if attributes.key?('type')
        self.type = attributes['type']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@xLanguage.empty? && @xLanguage.to_s.length > 16
        invalid_properties.push('invalid value for "xLanguage", the character length must be smaller than or equal to 16.')
      end

      if !@xLanguage.empty? && @xLanguage.to_s.length < 5
        invalid_properties.push('invalid value for "xLanguage", the character length must be great than or equal to 5.')
      end

      if @templateId.nil?
        invalid_properties.push('invalid value for "templateId", templateId cannot be nil.')
      end

      if @templateId.to_s.length > 32
        invalid_properties.push('invalid value for "templateId", the character length must be smaller than or equal to 32.')
      end

      if @templateId.to_s.length < 32
        invalid_properties.push('invalid value for "templateId", the character length must be great than or equal to 32.')
      end

      if @filePath.nil?
        invalid_properties.push('invalid value for "filePath", filePath cannot be nil.')
      end

      if @filePath.to_s.length > 1024
        invalid_properties.push('invalid value for "filePath", the character length must be smaller than or equal to 1024.')
      end

      if @filePath.to_s.length < 0
        invalid_properties.push('invalid value for "filePath", the character length must be great than or equal to 0.')
      end

      if !@type.empty? && @type.to_s.length > 16
        invalid_properties.push('invalid value for "type", the character length must be smaller than or equal to 16.')
      end

      if !@type.empty? && @type.to_s.length < 1
        invalid_properties.push('invalid value for "type", the character length must be great than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      xLanguage_validator = EnumAttributeValidator.new('String', ["zh-cn", "en-us"])
      return false unless xLanguage_validator.valid?(@xLanguage)
      return false if !@xLanguage.empty? && @xLanguage.to_s.length > 16
      return false if !@xLanguage.empty? && @xLanguage.to_s.length < 5
      return false if @templateId.nil?
      return false if @templateId.to_s.length > 32
      return false if @templateId.to_s.length < 32
      return false if @filePath.nil?
      return false if @filePath.to_s.length > 1024
      return false if @filePath.to_s.length < 0
      type_validator = EnumAttributeValidator.new('String', ["source-package", "introduction"])
      return false unless type_validator.valid?(@type)
      return false if !@type.empty? && @type.to_s.length > 16
      return false if !@type.empty? && @type.to_s.length < 1
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] xLanguage Object to be assigned
    def xLanguage=(xLanguage)
      validator = EnumAttributeValidator.new('String', ["zh-cn", "en-us"])
      unless validator.valid?(xLanguage)
        fail ArgumentError, "invalid value for \"xLanguage\", must be one of #{validator.allowable_values}."
      end
      @xLanguage = xLanguage
    end

    # Custom attribute writer method with validation
    # @param [Object] templateId Value to be assigned
    def templateId=(templateId)
      if templateId.nil?
        fail ArgumentError, 'templateId cannot be nil'
      end

      if templateId.to_s.length > 32
        fail ArgumentError, 'invalid value for "templateId", the character length must be smaller than or equal to 32.'
      end

      if templateId.to_s.length < 32
        fail ArgumentError, 'invalid value for "templateId", the character length must be great than or equal to 32.'
      end

      @templateId = templateId
    end

    # Custom attribute writer method with validation
    # @param [Object] filePath Value to be assigned
    def filePath=(filePath)
      if filePath.nil?
        fail ArgumentError, 'filePath cannot be nil'
      end

      if filePath.to_s.length > 1024
        fail ArgumentError, 'invalid value for "filePath", the character length must be smaller than or equal to 1024.'
      end

      if filePath.to_s.length < 0
        fail ArgumentError, 'invalid value for "filePath", the character length must be great than or equal to 0.'
      end

      @filePath = filePath
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["source-package", "introduction"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          xLanguage == o.xLanguage &&
          templateId == o.templateId &&
          filePath == o.filePath &&
          type == o.type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [xLanguage, templateId, filePath, type].hash
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
