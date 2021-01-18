require 'date'

# module DevStar
  class TemplateFile
    # 文件内容
    attr_accessor :content

    # 内容编码格式(固定base64)
    attr_accessor :encoding

    # 文件名
    attr_accessor :fileName

    # 文件相对路径
    attr_accessor :filePath

    # 文件类型
    attr_accessor :fileType

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :content => :'content',
        :encoding => :'encoding',
        :fileName => :'file_name',
        :filePath => :'file_path',
        :fileType => :'file_type'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :content => 'String',
        :encoding => 'String',
        :fileName => 'String',
        :filePath => 'String',
        :fileType => 'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DevStar::TemplateFile` initialize method"
      end

      

      if attributes.key?('content')
        self.content = attributes['content']
      end

      if attributes.key?('encoding')
        self.encoding = attributes['encoding']
      end

      if attributes.key?('file_name')
        self.fileName = attributes['file_name']
      end

      if attributes.key?('file_path')
        self.filePath = attributes['file_path']
      end

      if attributes.key?('file_type')
        self.fileType = attributes['file_type']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@content.empty? && @content.to_s.length > 10000000
        invalid_properties.push('invalid value for "content", the character length must be smaller than or equal to 10000000.')
      end

      if !@content.empty? && @content.to_s.length < 0
        invalid_properties.push('invalid value for "content", the character length must be great than or equal to 0.')
      end

      if !@encoding.empty? && @encoding.to_s.length > 6
        invalid_properties.push('invalid value for "encoding", the character length must be smaller than or equal to 6.')
      end

      if !@encoding.empty? && @encoding.to_s.length < 6
        invalid_properties.push('invalid value for "encoding", the character length must be great than or equal to 6.')
      end

      if !@fileName.empty? && @fileName.to_s.length > 128
        invalid_properties.push('invalid value for "fileName", the character length must be smaller than or equal to 128.')
      end

      if !@fileName.empty? && @fileName.to_s.length < 0
        invalid_properties.push('invalid value for "fileName", the character length must be great than or equal to 0.')
      end

      if !@filePath.empty? && @filePath.to_s.length > 512
        invalid_properties.push('invalid value for "filePath", the character length must be smaller than or equal to 512.')
      end

      if !@filePath.empty? && @filePath.to_s.length < 0
        invalid_properties.push('invalid value for "filePath", the character length must be great than or equal to 0.')
      end

      if !@fileType.empty? && @fileType.to_s.length > 128
        invalid_properties.push('invalid value for "fileType", the character length must be smaller than or equal to 128.')
      end

      if !@fileType.empty? && @fileType.to_s.length < 0
        invalid_properties.push('invalid value for "fileType", the character length must be great than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@content.empty? && @content.to_s.length > 10000000
      return false if !@content.empty? && @content.to_s.length < 0
      return false if !@encoding.empty? && @encoding.to_s.length > 6
      return false if !@encoding.empty? && @encoding.to_s.length < 6
      return false if !@fileName.empty? && @fileName.to_s.length > 128
      return false if !@fileName.empty? && @fileName.to_s.length < 0
      return false if !@filePath.empty? && @filePath.to_s.length > 512
      return false if !@filePath.empty? && @filePath.to_s.length < 0
      return false if !@fileType.empty? && @fileType.to_s.length > 128
      return false if !@fileType.empty? && @fileType.to_s.length < 0
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] content Value to be assigned
    def content=(content)
      if !content.empty? && content.to_s.length > 10000000
        fail ArgumentError, 'invalid value for "content", the character length must be smaller than or equal to 10000000.'
      end

      if !content.empty? && content.to_s.length < 0
        fail ArgumentError, 'invalid value for "content", the character length must be great than or equal to 0.'
      end

      @content = content
    end

    # Custom attribute writer method with validation
    # @param [Object] encoding Value to be assigned
    def encoding=(encoding)
      if !encoding.empty? && encoding.to_s.length > 6
        fail ArgumentError, 'invalid value for "encoding", the character length must be smaller than or equal to 6.'
      end

      if !encoding.empty? && encoding.to_s.length < 6
        fail ArgumentError, 'invalid value for "encoding", the character length must be great than or equal to 6.'
      end

      @encoding = encoding
    end

    # Custom attribute writer method with validation
    # @param [Object] fileName Value to be assigned
    def fileName=(fileName)
      if !fileName.empty? && fileName.to_s.length > 128
        fail ArgumentError, 'invalid value for "fileName", the character length must be smaller than or equal to 128.'
      end

      if !fileName.empty? && fileName.to_s.length < 0
        fail ArgumentError, 'invalid value for "fileName", the character length must be great than or equal to 0.'
      end

      @fileName = fileName
    end

    # Custom attribute writer method with validation
    # @param [Object] filePath Value to be assigned
    def filePath=(filePath)
      if !filePath.empty? && filePath.to_s.length > 512
        fail ArgumentError, 'invalid value for "filePath", the character length must be smaller than or equal to 512.'
      end

      if !filePath.empty? && filePath.to_s.length < 0
        fail ArgumentError, 'invalid value for "filePath", the character length must be great than or equal to 0.'
      end

      @filePath = filePath
    end

    # Custom attribute writer method with validation
    # @param [Object] fileType Value to be assigned
    def fileType=(fileType)
      if !fileType.empty? && fileType.to_s.length > 128
        fail ArgumentError, 'invalid value for "fileType", the character length must be smaller than or equal to 128.'
      end

      if !fileType.empty? && fileType.to_s.length < 0
        fail ArgumentError, 'invalid value for "fileType", the character length must be great than or equal to 0.'
      end

      @fileType = fileType
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          content == o.content &&
          encoding == o.encoding &&
          fileName == o.fileName &&
          filePath == o.filePath &&
          fileType == o.fileType
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [content, encoding, fileName, filePath, fileType].hash
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
