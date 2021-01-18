require 'date'

# module DevStar
  class TemplateQueryV2
    # 模板分类数组
    attr_accessor :category

    # 搜索关键字,支持按名称和描述搜索，默认null
    attr_accessor :keyword

    # 排序字段和排序顺序指定. 比如: desc(created_at),desc(usage_count)
    attr_accessor :sortBy

    # 标签（all，new，hot，推荐recommend）
    attr_accessor :label

    # 是否查询用户自己创建的模板，默认查所有模板
    attr_accessor :myTemplates

    # 查所有模板时只处理上架的；查用户模板，需支持按状态查询，状态：0审核中，1上架，2下架，不传表示查所有的（默认）
    attr_accessor :status

    # 模板状态数组
    attr_accessor :statusArray

    # 模板关联的云产品(产品短名)列表
    attr_accessor :productshorts

    # 偏移量, 表示从此偏移量开始查询, offset大于等于0
    attr_accessor :offset

    # 每页的模板条数
    attr_accessor :limit

    # 模板关联的自定义标签列表
    attr_accessor :tagIds

    # 模板类型（0:doc、1:code、2:pipeline、3:devops四种）
    attr_accessor :types

    # 动、静态代码模板标识（0：动态模板codetemplate，1：静态模板codesample）
    attr_accessor :isStatic

    # 平台来源（0:codelabs、1:devstar）
    attr_accessor :platformSource

    # 模板关联的标签名称列表
    attr_accessor :tagNames

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :category => :'category',
        :keyword => :'keyword',
        :sortBy => :'sort_by',
        :label => :'label',
        :myTemplates => :'my_templates',
        :status => :'status',
        :statusArray => :'status_array',
        :productshorts => :'productshorts',
        :offset => :'offset',
        :limit => :'limit',
        :tagIds => :'tag_ids',
        :types => :'types',
        :isStatic => :'is_static',
        :platformSource => :'platform_source',
        :tagNames => :'tag_names'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :category => 'Array<String>',
        :keyword => 'String',
        :sortBy => 'String',
        :label => 'String',
        :myTemplates => 'Boolean',
        :status => 'Integer',
        :statusArray => 'Array<Integer>',
        :productshorts => 'Array<String>',
        :offset => 'Integer',
        :limit => 'Integer',
        :tagIds => 'Array<String>',
        :types => 'Array<Integer>',
        :isStatic => 'Integer',
        :platformSource => 'Array<Integer>',
        :tagNames => 'Array<String>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DevStar::TemplateQueryV2` initialize method"
      end

      

      if attributes.key?('category')
        if (value = attributes['category']).is_a?(Array)
          self.category = value
        end
      end

      if attributes.key?('keyword')
        self.keyword = attributes['keyword']
      end

      if attributes.key?('sort_by')
        self.sortBy = attributes['sort_by']
      end

      if attributes.key?('label')
        self.label = attributes['label']
      end

      if attributes.key?('my_templates')
        self.myTemplates = attributes['my_templates']
      end

      if attributes.key?('status')
        self.status = attributes['status']
      end

      if attributes.key?('status_array')
        if (value = attributes['status_array']).is_a?(Array)
          self.statusArray = value
        end
      end

      if attributes.key?('productshorts')
        if (value = attributes['productshorts']).is_a?(Array)
          self.productshorts = value
        end
      end

      if attributes.key?('offset')
        self.offset = attributes['offset']
      end

      if attributes.key?('limit')
        self.limit = attributes['limit']
      end

      if attributes.key?('tag_ids')
        if (value = attributes['tag_ids']).is_a?(Array)
          self.tagIds = value
        end
      end

      if attributes.key?('types')
        if (value = attributes['types']).is_a?(Array)
          self.types = value
        end
      end

      if attributes.key?('is_static')
        self.isStatic = attributes['is_static']
      end

      if attributes.key?('platform_source')
        if (value = attributes['platform_source']).is_a?(Array)
          self.platformSource = value
        end
      end

      if attributes.key?('tag_names')
        if (value = attributes['tag_names']).is_a?(Array)
          self.tagNames = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@keyword.empty? && @keyword.to_s.length > 256
        invalid_properties.push('invalid value for "keyword", the character length must be smaller than or equal to 256.')
      end

      if !@keyword.empty? && @keyword.to_s.length < 1
        invalid_properties.push('invalid value for "keyword", the character length must be great than or equal to 1.')
      end

      if !@sortBy.empty? && @sortBy.to_s.length > 100
        invalid_properties.push('invalid value for "sortBy", the character length must be smaller than or equal to 100.')
      end

      if !@sortBy.empty? && @sortBy.to_s.length < 1
        invalid_properties.push('invalid value for "sortBy", the character length must be great than or equal to 1.')
      end

      if !@label.empty? && @label.to_s.length > 64
        invalid_properties.push('invalid value for "label", the character length must be smaller than or equal to 64.')
      end

      if !@label.empty? && @label.to_s.length < 1
        invalid_properties.push('invalid value for "label", the character length must be great than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@keyword.empty? && @keyword.to_s.length > 256
      return false if !@keyword.empty? && @keyword.to_s.length < 1
      return false if !@sortBy.empty? && @sortBy.to_s.length > 100
      return false if !@sortBy.empty? && @sortBy.to_s.length < 1
      return false if !@label.empty? && @label.to_s.length > 64
      return false if !@label.empty? && @label.to_s.length < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] keyword Value to be assigned
    def keyword=(keyword)
      if !keyword.empty? && keyword.to_s.length > 256
        fail ArgumentError, 'invalid value for "keyword", the character length must be smaller than or equal to 256.'
      end

      if !keyword.empty? && keyword.to_s.length < 1
        fail ArgumentError, 'invalid value for "keyword", the character length must be great than or equal to 1.'
      end

      @keyword = keyword
    end

    # Custom attribute writer method with validation
    # @param [Object] sortBy Value to be assigned
    def sortBy=(sortBy)
      if !sortBy.empty? && sortBy.to_s.length > 100
        fail ArgumentError, 'invalid value for "sortBy", the character length must be smaller than or equal to 100.'
      end

      if !sortBy.empty? && sortBy.to_s.length < 1
        fail ArgumentError, 'invalid value for "sortBy", the character length must be great than or equal to 1.'
      end

      @sortBy = sortBy
    end

    # Custom attribute writer method with validation
    # @param [Object] label Value to be assigned
    def label=(label)
      if !label.empty? && label.to_s.length > 64
        fail ArgumentError, 'invalid value for "label", the character length must be smaller than or equal to 64.'
      end

      if !label.empty? && label.to_s.length < 1
        fail ArgumentError, 'invalid value for "label", the character length must be great than or equal to 1.'
      end

      @label = label
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          category == o.category &&
          keyword == o.keyword &&
          sortBy == o.sortBy &&
          label == o.label &&
          myTemplates == o.myTemplates &&
          status == o.status &&
          statusArray == o.statusArray &&
          productshorts == o.productshorts &&
          offset == o.offset &&
          limit == o.limit &&
          tagIds == o.tagIds &&
          types == o.types &&
          isStatic == o.isStatic &&
          platformSource == o.platformSource &&
          tagNames == o.tagNames
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [category, keyword, sortBy, label, myTemplates, status, statusArray, productshorts, offset, limit, tagIds, types, isStatic, platformSource, tagNames].hash
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
