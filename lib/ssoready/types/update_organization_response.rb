# frozen_string_literal: true

require_relative "organization"
require "ostruct"
require "json"

module SSOReady
  class UpdateOrganizationResponse
    # @return [SSOReady::Organization] The updated organization.
    attr_reader :organization
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param organization [SSOReady::Organization] The updated organization.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::UpdateOrganizationResponse]
    def initialize(organization: OMIT, additional_properties: nil)
      @organization = organization if organization != OMIT
      @additional_properties = additional_properties
      @_field_set = { "organization": organization }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateOrganizationResponse
    #
    # @param json_object [String]
    # @return [SSOReady::UpdateOrganizationResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["organization"].nil?
        organization = nil
      else
        organization = parsed_json["organization"].to_json
        organization = SSOReady::Organization.from_json(json_object: organization)
      end
      new(organization: organization, additional_properties: struct)
    end

    # Serialize an instance of UpdateOrganizationResponse to a JSON object
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
      obj.organization.nil? || SSOReady::Organization.validate_raw(obj: obj.organization)
    end
  end
end
