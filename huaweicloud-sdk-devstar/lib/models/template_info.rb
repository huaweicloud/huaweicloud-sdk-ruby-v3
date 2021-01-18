require 'date'

# module DevStar
  class TemplateInfo
    # 模板id
    attr_accessor :id

    # 模板名
    attr_accessor :title

    # 模板描述
    attr_accessor :description

    # 模板关联的所有云服务（产品短名）
    attr_accessor :productshorts

    # 模板关联的云产品
    attr_accessor :products

    # 模板标签
    attr_accessor :topic

    # 模板创建者id
    attr_accessor :creatorId

    # 模板创建者,有别名返回别名
    attr_accessor :creator

    # 模板创建者,有别名返回别名
    attr_accessor :nickname

    # 模板评分（点赞数）
    attr_accessor :score

    # 模板标签（new、hot等）
    attr_accessor :label

    # 代码存储位置
    attr_accessor :store

    # 获取代码模版所需的信息
    attr_accessor :storeInfo

    # 模板状态（0:审核中 1: 已上架 2: 未上架（已下架）3: 未上架（合规检查不通过）4：未上架（待上架）5：已删除）
    attr_accessor :status

    # 访问量
    attr_accessor :viewCount

    # 引用量
    attr_accessor :usageCount

    # 创建时间
    attr_accessor :createdAt

    # 更新时间
    attr_accessor :updatedAt

    # 模板上架时间
    attr_accessor :publishedAt

    # 点赞状态(1：点赞，0：未点赞)
    attr_accessor :favoriteState

    # 模板标签
    attr_accessor :tags

    # 模板类型（0:doc、1:code、2:pipeline、3:devops四种）
    attr_accessor :type

    # 动、静态代码模板标识（0：动态模板codetemplate，1：静态模板codesample）
    attr_accessor :isStatic

    # 模板相关联的所有维护人账号名称
    attr_accessor :maintainers

    attr_accessor :pipelineTemplate

    # 平台来源（0:codelabs、1:devstar）
    attr_accessor :platformSource

    # 相关文档，示例，帖子
    attr_accessor :references

    # 模板自定义参数列表
    attr_accessor :properties

    # dependency信息
    attr_accessor :dependencies

    # dependency类型
    attr_accessor :dependencyType

    # 关联论坛板块id
    attr_accessor :forumId

    # 模板文件解压缩之后的大小(单位:KB)
    attr_accessor :fileSize

    # 部署信息
    attr_accessor :deployment

    # 模板关联更新态Id
    attr_accessor :updateId

    # 是否支持使用CloudIDE运行源码
    attr_accessor :isSupportCloudide

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :id => :'id',
        :title => :'title',
        :description => :'description',
        :productshorts => :'productshorts',
        :products => :'products',
        :topic => :'topic',
        :creatorId => :'creator_id',
        :creator => :'creator',
        :nickname => :'nickname',
        :score => :'score',
        :label => :'label',
        :store => :'store',
        :storeInfo => :'store_info',
        :status => :'status',
        :viewCount => :'view_count',
        :usageCount => :'usage_count',
        :createdAt => :'created_at',
        :updatedAt => :'updated_at',
        :publishedAt => :'published_at',
        :favoriteState => :'favorite_state',
        :tags => :'tags',
        :type => :'type',
        :isStatic => :'is_static',
        :maintainers => :'maintainers',
        :pipelineTemplate => :'pipeline_template',
        :platformSource => :'platform_source',
        :references => :'references',
        :properties => :'properties',
        :dependencies => :'dependencies',
        :dependencyType => :'dependency_type',
        :forumId => :'forum_id',
        :fileSize => :'file_size',
        :deployment => :'deployment',
        :updateId => :'update_id',
        :isSupportCloudide => :'is_support_cloudide'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :id => 'String',
        :title => 'String',
        :description => 'String',
        :productshorts => 'Array<String>',
        :products => 'Array<TemplateProductExt>',
        :topic => 'Array<TopicCategory>',
        :creatorId => 'String',
        :creator => 'String',
        :nickname => 'String',
        :score => 'Integer',
        :label => 'String',
        :store => 'Integer',
        :storeInfo => 'String',
        :status => 'Integer',
        :viewCount => 'Integer',
        :usageCount => 'Integer',
        :createdAt => 'String',
        :updatedAt => 'String',
        :publishedAt => 'String',
        :favoriteState => 'Integer',
        :tags => 'Array<TagInfo>',
        :type => 'Integer',
        :isStatic => 'Integer',
        :maintainers => 'Array<String>',
        :pipelineTemplate => 'PipelineTemplateInfo',
        :platformSource => 'Integer',
        :references => 'Array<Reference>',
        :properties => 'Object',
        :dependencies => 'Array<Object>',
        :dependencyType => 'String',
        :forumId => 'Integer',
        :fileSize => 'Integer',
        :deployment => 'Object',
        :updateId => 'String',
        :isSupportCloudide => 'Boolean'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `DevStar::TemplateInfo` initialize method"
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

      if attributes.key?('productshorts')
        if (value = attributes['productshorts']).is_a?(Array)
          self.productshorts = value
        end
      end

      if attributes.key?('products')
        if (value = attributes['products']).is_a?(Array)
          self.products = value
        end
      end

      if attributes.key?('topic')
        if (value = attributes['topic']).is_a?(Array)
          self.topic = value
        end
      end

      if attributes.key?('creator_id')
        self.creatorId = attributes['creator_id']
      end

      if attributes.key?('creator')
        self.creator = attributes['creator']
      end

      if attributes.key?('nickname')
        self.nickname = attributes['nickname']
      end

      if attributes.key?('score')
        self.score = attributes['score']
      end

      if attributes.key?('label')
        self.label = attributes['label']
      end

      if attributes.key?('store')
        self.store = attributes['store']
      end

      if attributes.key?('store_info')
        self.storeInfo = attributes['store_info']
      end

      if attributes.key?('status')
        self.status = attributes['status']
      end

      if attributes.key?('view_count')
        self.viewCount = attributes['view_count']
      end

      if attributes.key?('usage_count')
        self.usageCount = attributes['usage_count']
      end

      if attributes.key?('created_at')
        self.createdAt = attributes['created_at']
      end

      if attributes.key?('updated_at')
        self.updatedAt = attributes['updated_at']
      end

      if attributes.key?('published_at')
        self.publishedAt = attributes['published_at']
      end

      if attributes.key?('favorite_state')
        self.favoriteState = attributes['favorite_state']
      end

      if attributes.key?('tags')
        if (value = attributes['tags']).is_a?(Array)
          self.tags = value
        end
      end

      if attributes.key?('type')
        self.type = attributes['type']
      end

      if attributes.key?('is_static')
        self.isStatic = attributes['is_static']
      end

      if attributes.key?('maintainers')
        if (value = attributes['maintainers']).is_a?(Array)
          self.maintainers = value
        end
      end

      if attributes.key?('pipeline_template')
        self.pipelineTemplate = attributes['pipeline_template']
      end

      if attributes.key?('platform_source')
        self.platformSource = attributes['platform_source']
      end

      if attributes.key?('references')
        if (value = attributes['references']).is_a?(Array)
          self.references = value
        end
      end

      if attributes.key?('properties')
        self.properties = attributes['properties']
      end

      if attributes.key?('dependencies')
        if (value = attributes['dependencies']).is_a?(Array)
          self.dependencies = value
        end
      end

      if attributes.key?('dependency_type')
        self.dependencyType = attributes['dependency_type']
      end

      if attributes.key?('forum_id')
        self.forumId = attributes['forum_id']
      end

      if attributes.key?('file_size')
        self.fileSize = attributes['file_size']
      end

      if attributes.key?('deployment')
        self.deployment = attributes['deployment']
      end

      if attributes.key?('update_id')
        self.updateId = attributes['update_id']
      end

      if attributes.key?('is_support_cloudide')
        self.isSupportCloudide = attributes['is_support_cloudide']
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

      if !@title.empty? && @title.to_s.length > 128
        invalid_properties.push('invalid value for "title", the character length must be smaller than or equal to 128.')
      end

      if !@title.empty? && @title.to_s.length < 1
        invalid_properties.push('invalid value for "title", the character length must be great than or equal to 1.')
      end

      if !@description.empty? && @description.to_s.length > 255
        invalid_properties.push('invalid value for "description", the character length must be smaller than or equal to 255.')
      end

      if !@description.empty? && @description.to_s.length < 1
        invalid_properties.push('invalid value for "description", the character length must be great than or equal to 1.')
      end

      if !@creatorId.empty? && @creatorId.to_s.length > 32
        invalid_properties.push('invalid value for "creatorId", the character length must be smaller than or equal to 32.')
      end

      if !@creatorId.empty? && @creatorId.to_s.length < 32
        invalid_properties.push('invalid value for "creatorId", the character length must be great than or equal to 32.')
      end

      if !@creator.empty? && @creator.to_s.length > 128
        invalid_properties.push('invalid value for "creator", the character length must be smaller than or equal to 128.')
      end

      if !@creator.empty? && @creator.to_s.length < 1
        invalid_properties.push('invalid value for "creator", the character length must be great than or equal to 1.')
      end

      if !@nickname.empty? && @nickname.to_s.length > 128
        invalid_properties.push('invalid value for "nickname", the character length must be smaller than or equal to 128.')
      end

      if !@nickname.empty? && @nickname.to_s.length < 1
        invalid_properties.push('invalid value for "nickname", the character length must be great than or equal to 1.')
      end

      if !@label.empty? && @label.to_s.length > 255
        invalid_properties.push('invalid value for "label", the character length must be smaller than or equal to 255.')
      end

      if !@label.empty? && @label.to_s.length < 1
        invalid_properties.push('invalid value for "label", the character length must be great than or equal to 1.')
      end

      if !@storeInfo.empty? && @storeInfo.to_s.length > 255
        invalid_properties.push('invalid value for "storeInfo", the character length must be smaller than or equal to 255.')
      end

      if !@storeInfo.empty? && @storeInfo.to_s.length < 1
        invalid_properties.push('invalid value for "storeInfo", the character length must be great than or equal to 1.')
      end

      if !@createdAt.empty? && @createdAt.to_s.length > 64
        invalid_properties.push('invalid value for "createdAt", the character length must be smaller than or equal to 64.')
      end

      if !@createdAt.empty? && @createdAt.to_s.length < 1
        invalid_properties.push('invalid value for "createdAt", the character length must be great than or equal to 1.')
      end

      if !@updatedAt.empty? && @updatedAt.to_s.length > 64
        invalid_properties.push('invalid value for "updatedAt", the character length must be smaller than or equal to 64.')
      end

      if !@updatedAt.empty? && @updatedAt.to_s.length < 1
        invalid_properties.push('invalid value for "updatedAt", the character length must be great than or equal to 1.')
      end

      if !@publishedAt.empty? && @publishedAt.to_s.length > 64
        invalid_properties.push('invalid value for "publishedAt", the character length must be smaller than or equal to 64.')
      end

      if !@publishedAt.empty? && @publishedAt.to_s.length < 1
        invalid_properties.push('invalid value for "publishedAt", the character length must be great than or equal to 1.')
      end

      if !@dependencyType.empty? && @dependencyType.to_s.length > 1
        invalid_properties.push('invalid value for "dependencyType", the character length must be smaller than or equal to 1.')
      end

      if !@dependencyType.empty? && @dependencyType.to_s.length < 1
        invalid_properties.push('invalid value for "dependencyType", the character length must be great than or equal to 1.')
      end

      if !@updateId.empty? && @updateId.to_s.length > 32
        invalid_properties.push('invalid value for "updateId", the character length must be smaller than or equal to 32.')
      end

      if !@updateId.empty? && @updateId.to_s.length < 32
        invalid_properties.push('invalid value for "updateId", the character length must be great than or equal to 32.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@id.empty? && @id.to_s.length > 32
      return false if !@id.empty? && @id.to_s.length < 32
      return false if !@title.empty? && @title.to_s.length > 128
      return false if !@title.empty? && @title.to_s.length < 1
      return false if !@description.empty? && @description.to_s.length > 255
      return false if !@description.empty? && @description.to_s.length < 1
      return false if !@creatorId.empty? && @creatorId.to_s.length > 32
      return false if !@creatorId.empty? && @creatorId.to_s.length < 32
      return false if !@creator.empty? && @creator.to_s.length > 128
      return false if !@creator.empty? && @creator.to_s.length < 1
      return false if !@nickname.empty? && @nickname.to_s.length > 128
      return false if !@nickname.empty? && @nickname.to_s.length < 1
      return false if !@label.empty? && @label.to_s.length > 255
      return false if !@label.empty? && @label.to_s.length < 1
      return false if !@storeInfo.empty? && @storeInfo.to_s.length > 255
      return false if !@storeInfo.empty? && @storeInfo.to_s.length < 1
      return false if !@createdAt.empty? && @createdAt.to_s.length > 64
      return false if !@createdAt.empty? && @createdAt.to_s.length < 1
      return false if !@updatedAt.empty? && @updatedAt.to_s.length > 64
      return false if !@updatedAt.empty? && @updatedAt.to_s.length < 1
      return false if !@publishedAt.empty? && @publishedAt.to_s.length > 64
      return false if !@publishedAt.empty? && @publishedAt.to_s.length < 1
      return false if !@dependencyType.empty? && @dependencyType.to_s.length > 1
      return false if !@dependencyType.empty? && @dependencyType.to_s.length < 1
      return false if !@updateId.empty? && @updateId.to_s.length > 32
      return false if !@updateId.empty? && @updateId.to_s.length < 32
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
      if !title.empty? && title.to_s.length > 128
        fail ArgumentError, 'invalid value for "title", the character length must be smaller than or equal to 128.'
      end

      if !title.empty? && title.to_s.length < 1
        fail ArgumentError, 'invalid value for "title", the character length must be great than or equal to 1.'
      end

      @title = title
    end

    # Custom attribute writer method with validation
    # @param [Object] description Value to be assigned
    def description=(description)
      if !description.empty? && description.to_s.length > 255
        fail ArgumentError, 'invalid value for "description", the character length must be smaller than or equal to 255.'
      end

      if !description.empty? && description.to_s.length < 1
        fail ArgumentError, 'invalid value for "description", the character length must be great than or equal to 1.'
      end

      @description = description
    end

    # Custom attribute writer method with validation
    # @param [Object] creatorId Value to be assigned
    def creatorId=(creatorId)
      if !creatorId.empty? && creatorId.to_s.length > 32
        fail ArgumentError, 'invalid value for "creatorId", the character length must be smaller than or equal to 32.'
      end

      if !creatorId.empty? && creatorId.to_s.length < 32
        fail ArgumentError, 'invalid value for "creatorId", the character length must be great than or equal to 32.'
      end

      @creatorId = creatorId
    end

    # Custom attribute writer method with validation
    # @param [Object] creator Value to be assigned
    def creator=(creator)
      if !creator.empty? && creator.to_s.length > 128
        fail ArgumentError, 'invalid value for "creator", the character length must be smaller than or equal to 128.'
      end

      if !creator.empty? && creator.to_s.length < 1
        fail ArgumentError, 'invalid value for "creator", the character length must be great than or equal to 1.'
      end

      @creator = creator
    end

    # Custom attribute writer method with validation
    # @param [Object] nickname Value to be assigned
    def nickname=(nickname)
      if !nickname.empty? && nickname.to_s.length > 128
        fail ArgumentError, 'invalid value for "nickname", the character length must be smaller than or equal to 128.'
      end

      if !nickname.empty? && nickname.to_s.length < 1
        fail ArgumentError, 'invalid value for "nickname", the character length must be great than or equal to 1.'
      end

      @nickname = nickname
    end

    # Custom attribute writer method with validation
    # @param [Object] label Value to be assigned
    def label=(label)
      if !label.empty? && label.to_s.length > 255
        fail ArgumentError, 'invalid value for "label", the character length must be smaller than or equal to 255.'
      end

      if !label.empty? && label.to_s.length < 1
        fail ArgumentError, 'invalid value for "label", the character length must be great than or equal to 1.'
      end

      @label = label
    end

    # Custom attribute writer method with validation
    # @param [Object] storeInfo Value to be assigned
    def storeInfo=(storeInfo)
      if !storeInfo.empty? && storeInfo.to_s.length > 255
        fail ArgumentError, 'invalid value for "storeInfo", the character length must be smaller than or equal to 255.'
      end

      if !storeInfo.empty? && storeInfo.to_s.length < 1
        fail ArgumentError, 'invalid value for "storeInfo", the character length must be great than or equal to 1.'
      end

      @storeInfo = storeInfo
    end

    # Custom attribute writer method with validation
    # @param [Object] createdAt Value to be assigned
    def createdAt=(createdAt)
      if !createdAt.empty? && createdAt.to_s.length > 64
        fail ArgumentError, 'invalid value for "createdAt", the character length must be smaller than or equal to 64.'
      end

      if !createdAt.empty? && createdAt.to_s.length < 1
        fail ArgumentError, 'invalid value for "createdAt", the character length must be great than or equal to 1.'
      end

      @createdAt = createdAt
    end

    # Custom attribute writer method with validation
    # @param [Object] updatedAt Value to be assigned
    def updatedAt=(updatedAt)
      if !updatedAt.empty? && updatedAt.to_s.length > 64
        fail ArgumentError, 'invalid value for "updatedAt", the character length must be smaller than or equal to 64.'
      end

      if !updatedAt.empty? && updatedAt.to_s.length < 1
        fail ArgumentError, 'invalid value for "updatedAt", the character length must be great than or equal to 1.'
      end

      @updatedAt = updatedAt
    end

    # Custom attribute writer method with validation
    # @param [Object] publishedAt Value to be assigned
    def publishedAt=(publishedAt)
      if !publishedAt.empty? && publishedAt.to_s.length > 64
        fail ArgumentError, 'invalid value for "publishedAt", the character length must be smaller than or equal to 64.'
      end

      if !publishedAt.empty? && publishedAt.to_s.length < 1
        fail ArgumentError, 'invalid value for "publishedAt", the character length must be great than or equal to 1.'
      end

      @publishedAt = publishedAt
    end

    # Custom attribute writer method with validation
    # @param [Object] dependencyType Value to be assigned
    def dependencyType=(dependencyType)
      if !dependencyType.empty? && dependencyType.to_s.length > 1
        fail ArgumentError, 'invalid value for "dependencyType", the character length must be smaller than or equal to 1.'
      end

      if !dependencyType.empty? && dependencyType.to_s.length < 1
        fail ArgumentError, 'invalid value for "dependencyType", the character length must be great than or equal to 1.'
      end

      @dependencyType = dependencyType
    end

    # Custom attribute writer method with validation
    # @param [Object] updateId Value to be assigned
    def updateId=(updateId)
      if !updateId.empty? && updateId.to_s.length > 32
        fail ArgumentError, 'invalid value for "updateId", the character length must be smaller than or equal to 32.'
      end

      if !updateId.empty? && updateId.to_s.length < 32
        fail ArgumentError, 'invalid value for "updateId", the character length must be great than or equal to 32.'
      end

      @updateId = updateId
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          title == o.title &&
          description == o.description &&
          productshorts == o.productshorts &&
          products == o.products &&
          topic == o.topic &&
          creatorId == o.creatorId &&
          creator == o.creator &&
          nickname == o.nickname &&
          score == o.score &&
          label == o.label &&
          store == o.store &&
          storeInfo == o.storeInfo &&
          status == o.status &&
          viewCount == o.viewCount &&
          usageCount == o.usageCount &&
          createdAt == o.createdAt &&
          updatedAt == o.updatedAt &&
          publishedAt == o.publishedAt &&
          favoriteState == o.favoriteState &&
          tags == o.tags &&
          type == o.type &&
          isStatic == o.isStatic &&
          maintainers == o.maintainers &&
          pipelineTemplate == o.pipelineTemplate &&
          platformSource == o.platformSource &&
          references == o.references &&
          properties == o.properties &&
          dependencies == o.dependencies &&
          dependencyType == o.dependencyType &&
          forumId == o.forumId &&
          fileSize == o.fileSize &&
          deployment == o.deployment &&
          updateId == o.updateId &&
          isSupportCloudide == o.isSupportCloudide
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, title, description, productshorts, products, topic, creatorId, creator, nickname, score, label, store, storeInfo, status, viewCount, usageCount, createdAt, updatedAt, publishedAt, favoriteState, tags, type, isStatic, maintainers, pipelineTemplate, platformSource, references, properties, dependencies, dependencyType, forumId, fileSize, deployment, updateId, isSupportCloudide].hash
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
