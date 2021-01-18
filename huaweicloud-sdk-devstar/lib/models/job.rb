require 'date'

# module DevStar
  class Job
    # 任务的id
    attr_accessor :id

    # 任务的名称
    attr_accessor :name

    # 任务的状态
    attr_accessor :jobStatus

    # 任务结果信息
    attr_accessor :jobResult

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :id => :'id',
        :name => :'name',
        :jobStatus => :'job_status',
        :jobResult => :'job_result'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :id => 'String',
        :name => 'String',
        :jobStatus => 'Object',
        :jobResult => 'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DevStar::Job` initialize method"
      end

      

      if attributes.key?('id')
        self.id = attributes['id']
      end

      if attributes.key?('name')
        self.name = attributes['name']
      end

      if attributes.key?('job_status')
        self.jobStatus = attributes['job_status']
      end

      if attributes.key?('job_result')
        self.jobResult = attributes['job_result']
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

      if !@name.empty? && @name.to_s.length > 100
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 100.')
      end

      if !@name.empty? && @name.to_s.length < 1
        invalid_properties.push('invalid value for "name", the character length must be great than or equal to 1.')
      end

      if !@jobResult.empty? && @jobResult.to_s.length > 100
        invalid_properties.push('invalid value for "jobResult", the character length must be smaller than or equal to 100.')
      end

      if !@jobResult.empty? && @jobResult.to_s.length < 1
        invalid_properties.push('invalid value for "jobResult", the character length must be great than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@id.empty? && @id.to_s.length > 32
      return false if !@id.empty? && @id.to_s.length < 32
      return false if !@name.empty? && @name.to_s.length > 100
      return false if !@name.empty? && @name.to_s.length < 1
      return false if !@jobResult.empty? && @jobResult.to_s.length > 100
      return false if !@jobResult.empty? && @jobResult.to_s.length < 1
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
    # @param [Object] name Value to be assigned
    def name=(name)
      if !name.empty? && name.to_s.length > 100
        fail ArgumentError, 'invalid value for "name", the character length must be smaller than or equal to 100.'
      end

      if !name.empty? && name.to_s.length < 1
        fail ArgumentError, 'invalid value for "name", the character length must be great than or equal to 1.'
      end

      @name = name
    end

    # Custom attribute writer method with validation
    # @param [Object] jobResult Value to be assigned
    def jobResult=(jobResult)
      if !jobResult.empty? && jobResult.to_s.length > 100
        fail ArgumentError, 'invalid value for "jobResult", the character length must be smaller than or equal to 100.'
      end

      if !jobResult.empty? && jobResult.to_s.length < 1
        fail ArgumentError, 'invalid value for "jobResult", the character length must be great than or equal to 1.'
      end

      @jobResult = jobResult
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          name == o.name &&
          jobStatus == o.jobStatus &&
          jobResult == o.jobResult
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, name, jobStatus, jobResult].hash
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
