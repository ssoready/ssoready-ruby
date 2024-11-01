# frozen_string_literal: true

require_relative "scim_user"
require "ostruct"
require "json"

module SSOReady
  class GetSCIMUserResponse
    # @return [SSOReady::SCIMUser] The requested SCIM user.
    attr_reader :scim_user
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scim_user [SSOReady::SCIMUser] The requested SCIM user.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::GetSCIMUserResponse]
    def initialize(scim_user: OMIT, additional_properties: nil)
      @scim_user = scim_user if scim_user != OMIT
      @additional_properties = additional_properties
      @_field_set = { "scimUser": scim_user }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GetSCIMUserResponse
    #
    # @param json_object [String]
    # @return [SSOReady::GetSCIMUserResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["scimUser"].nil?
        scim_user = nil
      else
        scim_user = parsed_json["scimUser"].to_json
        scim_user = SSOReady::SCIMUser.from_json(json_object: scim_user)
      end
      new(scim_user: scim_user, additional_properties: struct)
    end

    # Serialize an instance of GetSCIMUserResponse to a JSON object
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
      obj.scim_user.nil? || SSOReady::SCIMUser.validate_raw(obj: obj.scim_user)
    end
  end
end
