require 'date'

# module DevStar
  class TemplateProductExt
    # 产品id
    attr_accessor :id

    # 产品短名
    attr_accessor :productshort

    # 产品名
    attr_accessor :productName

    # 首页链接
    attr_accessor :homeLink

    # api调试链接
    attr_accessor :apiLink

    # sdk下载链接
    attr_accessor :sdkLink

    # 文档链接
    attr_accessor :docLink

    # logo链接
    attr_accessor :logoLink

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :id => :'id',
        :productshort => :'productshort',
        :productName => :'product_name',
        :homeLink => :'home_link',
        :apiLink => :'api_link',
        :sdkLink => :'sdk_link',
        :docLink => :'doc_link',
        :logoLink => :'logo_link'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :id => 'String',
        :productshort => 'String',
        :productName => 'String',
        :homeLink => 'String',
        :apiLink => 'String',
        :sdkLink => 'String',
        :docLink => 'String',
        :logoLink => 'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DevStar::TemplateProductExt` initialize method"
      end

      

      if attributes.key?('id')
        self.id = attributes['id']
      end

      if attributes.key?('productshort')
        self.productshort = attributes['productshort']
      end

      if attributes.key?('product_name')
        self.productName = attributes['product_name']
      end

      if attributes.key?('home_link')
        self.homeLink = attributes['home_link']
      end

      if attributes.key?('api_link')
        self.apiLink = attributes['api_link']
      end

      if attributes.key?('sdk_link')
        self.sdkLink = attributes['sdk_link']
      end

      if attributes.key?('doc_link')
        self.docLink = attributes['doc_link']
      end

      if attributes.key?('logo_link')
        self.logoLink = attributes['logo_link']
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

      if !@productshort.empty? && @productshort.to_s.length > 128
        invalid_properties.push('invalid value for "productshort", the character length must be smaller than or equal to 128.')
      end

      if !@productshort.empty? && @productshort.to_s.length < 1
        invalid_properties.push('invalid value for "productshort", the character length must be great than or equal to 1.')
      end

      if !@productName.empty? && @productName.to_s.length > 128
        invalid_properties.push('invalid value for "productName", the character length must be smaller than or equal to 128.')
      end

      if !@productName.empty? && @productName.to_s.length < 1
        invalid_properties.push('invalid value for "productName", the character length must be great than or equal to 1.')
      end

      if !@homeLink.empty? && @homeLink.to_s.length > 512
        invalid_properties.push('invalid value for "homeLink", the character length must be smaller than or equal to 512.')
      end

      if !@homeLink.empty? && @homeLink.to_s.length < 1
        invalid_properties.push('invalid value for "homeLink", the character length must be great than or equal to 1.')
      end

      if !@apiLink.empty? && @apiLink.to_s.length > 512
        invalid_properties.push('invalid value for "apiLink", the character length must be smaller than or equal to 512.')
      end

      if !@apiLink.empty? && @apiLink.to_s.length < 1
        invalid_properties.push('invalid value for "apiLink", the character length must be great than or equal to 1.')
      end

      if !@sdkLink.empty? && @sdkLink.to_s.length > 512
        invalid_properties.push('invalid value for "sdkLink", the character length must be smaller than or equal to 512.')
      end

      if !@sdkLink.empty? && @sdkLink.to_s.length < 1
        invalid_properties.push('invalid value for "sdkLink", the character length must be great than or equal to 1.')
      end

      if !@docLink.empty? && @docLink.to_s.length > 512
        invalid_properties.push('invalid value for "docLink", the character length must be smaller than or equal to 512.')
      end

      if !@docLink.empty? && @docLink.to_s.length < 1
        invalid_properties.push('invalid value for "docLink", the character length must be great than or equal to 1.')
      end

      if !@logoLink.empty? && @logoLink.to_s.length > 512
        invalid_properties.push('invalid value for "logoLink", the character length must be smaller than or equal to 512.')
      end

      if !@logoLink.empty? && @logoLink.to_s.length < 1
        invalid_properties.push('invalid value for "logoLink", the character length must be great than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@id.empty? && @id.to_s.length > 32
      return false if !@id.empty? && @id.to_s.length < 32
      return false if !@productshort.empty? && @productshort.to_s.length > 128
      return false if !@productshort.empty? && @productshort.to_s.length < 1
      return false if !@productName.empty? && @productName.to_s.length > 128
      return false if !@productName.empty? && @productName.to_s.length < 1
      return false if !@homeLink.empty? && @homeLink.to_s.length > 512
      return false if !@homeLink.empty? && @homeLink.to_s.length < 1
      return false if !@apiLink.empty? && @apiLink.to_s.length > 512
      return false if !@apiLink.empty? && @apiLink.to_s.length < 1
      return false if !@sdkLink.empty? && @sdkLink.to_s.length > 512
      return false if !@sdkLink.empty? && @sdkLink.to_s.length < 1
      return false if !@docLink.empty? && @docLink.to_s.length > 512
      return false if !@docLink.empty? && @docLink.to_s.length < 1
      return false if !@logoLink.empty? && @logoLink.to_s.length > 512
      return false if !@logoLink.empty? && @logoLink.to_s.length < 1
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
    # @param [Object] productshort Value to be assigned
    def productshort=(productshort)
      if !productshort.empty? && productshort.to_s.length > 128
        fail ArgumentError, 'invalid value for "productshort", the character length must be smaller than or equal to 128.'
      end

      if !productshort.empty? && productshort.to_s.length < 1
        fail ArgumentError, 'invalid value for "productshort", the character length must be great than or equal to 1.'
      end

      @productshort = productshort
    end

    # Custom attribute writer method with validation
    # @param [Object] productName Value to be assigned
    def productName=(productName)
      if !productName.empty? && productName.to_s.length > 128
        fail ArgumentError, 'invalid value for "productName", the character length must be smaller than or equal to 128.'
      end

      if !productName.empty? && productName.to_s.length < 1
        fail ArgumentError, 'invalid value for "productName", the character length must be great than or equal to 1.'
      end

      @productName = productName
    end

    # Custom attribute writer method with validation
    # @param [Object] homeLink Value to be assigned
    def homeLink=(homeLink)
      if !homeLink.empty? && homeLink.to_s.length > 512
        fail ArgumentError, 'invalid value for "homeLink", the character length must be smaller than or equal to 512.'
      end

      if !homeLink.empty? && homeLink.to_s.length < 1
        fail ArgumentError, 'invalid value for "homeLink", the character length must be great than or equal to 1.'
      end

      @homeLink = homeLink
    end

    # Custom attribute writer method with validation
    # @param [Object] apiLink Value to be assigned
    def apiLink=(apiLink)
      if !apiLink.empty? && apiLink.to_s.length > 512
        fail ArgumentError, 'invalid value for "apiLink", the character length must be smaller than or equal to 512.'
      end

      if !apiLink.empty? && apiLink.to_s.length < 1
        fail ArgumentError, 'invalid value for "apiLink", the character length must be great than or equal to 1.'
      end

      @apiLink = apiLink
    end

    # Custom attribute writer method with validation
    # @param [Object] sdkLink Value to be assigned
    def sdkLink=(sdkLink)
      if !sdkLink.empty? && sdkLink.to_s.length > 512
        fail ArgumentError, 'invalid value for "sdkLink", the character length must be smaller than or equal to 512.'
      end

      if !sdkLink.empty? && sdkLink.to_s.length < 1
        fail ArgumentError, 'invalid value for "sdkLink", the character length must be great than or equal to 1.'
      end

      @sdkLink = sdkLink
    end

    # Custom attribute writer method with validation
    # @param [Object] docLink Value to be assigned
    def docLink=(docLink)
      if !docLink.empty? && docLink.to_s.length > 512
        fail ArgumentError, 'invalid value for "docLink", the character length must be smaller than or equal to 512.'
      end

      if !docLink.empty? && docLink.to_s.length < 1
        fail ArgumentError, 'invalid value for "docLink", the character length must be great than or equal to 1.'
      end

      @docLink = docLink
    end

    # Custom attribute writer method with validation
    # @param [Object] logoLink Value to be assigned
    def logoLink=(logoLink)
      if !logoLink.empty? && logoLink.to_s.length > 512
        fail ArgumentError, 'invalid value for "logoLink", the character length must be smaller than or equal to 512.'
      end

      if !logoLink.empty? && logoLink.to_s.length < 1
        fail ArgumentError, 'invalid value for "logoLink", the character length must be great than or equal to 1.'
      end

      @logoLink = logoLink
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          productshort == o.productshort &&
          productName == o.productName &&
          homeLink == o.homeLink &&
          apiLink == o.apiLink &&
          sdkLink == o.sdkLink &&
          docLink == o.docLink &&
          logoLink == o.logoLink
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, productshort, productName, homeLink, apiLink, sdkLink, docLink, logoLink].hash
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
