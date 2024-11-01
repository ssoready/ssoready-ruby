# frozen_string_literal: true

require "ostruct"
require "json"

module SSOReady
  # Contains an arbitrary serialized message along with a @type that describes the
  #  type of the serialized message.
  class GoogleProtobufAny
    # @return [String] The type of the serialized message.
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] The type of the serialized message.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::GoogleProtobufAny]
    def initialize(type: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "@type": type }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GoogleProtobufAny
    #
    # @param json_object [String]
    # @return [SSOReady::GoogleProtobufAny]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      type = struct["@type"]
      new(type: type, additional_properties: struct)
    end

    # Serialize an instance of GoogleProtobufAny to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
