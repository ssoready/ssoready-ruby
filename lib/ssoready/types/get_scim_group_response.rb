# frozen_string_literal: true

require_relative "scim_group"
require "ostruct"
require "json"

module SSOReady
  class GetSCIMGroupResponse
    # @return [SSOReady::SCIMGroup] The requested SCIM group.
    attr_reader :scim_group
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scim_group [SSOReady::SCIMGroup] The requested SCIM group.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::GetSCIMGroupResponse]
    def initialize(scim_group: OMIT, additional_properties: nil)
      @scim_group = scim_group if scim_group != OMIT
      @additional_properties = additional_properties
      @_field_set = { "scimGroup": scim_group }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GetSCIMGroupResponse
    #
    # @param json_object [String]
    # @return [SSOReady::GetSCIMGroupResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["scimGroup"].nil?
        scim_group = nil
      else
        scim_group = parsed_json["scimGroup"].to_json
        scim_group = SSOReady::SCIMGroup.from_json(json_object: scim_group)
      end
      new(scim_group: scim_group, additional_properties: struct)
    end

    # Serialize an instance of GetSCIMGroupResponse to a JSON object
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
      obj.scim_group.nil? || SSOReady::SCIMGroup.validate_raw(obj: obj.scim_group)
    end
  end
end
