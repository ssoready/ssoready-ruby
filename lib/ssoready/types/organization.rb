# frozen_string_literal: true

require "ostruct"
require "json"

module SSOReady
  class Organization
    # @return [String] Unique identifier for this organization.
    attr_reader :id
    # @return [String] The environment this organization belongs to.
    attr_reader :environment_id
    # @return [String] An optional human-friendly name for this organization.
    attr_reader :display_name
    # @return [String] An identifier you can attach to an organization. Meant to be used to correlate
    #  an SSOReady organization to your
    #  internal equivalent concept.
    #  External IDs are unique within an environment. No two organizations in the same
    #  environment can have
    #  the same external ID.
    attr_reader :external_id
    # @return [Array<String>] A list of domains that users from this organization use.
    #  SAML connections and SCIM directories within this organization will only produce
    #  users whose email are included in
    #  `domains`. SSOReady will reject SAML and SCIM users that do not fall within
    #  `domains`.
    attr_reader :domains
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for this organization.
    # @param environment_id [String] The environment this organization belongs to.
    # @param display_name [String] An optional human-friendly name for this organization.
    # @param external_id [String] An identifier you can attach to an organization. Meant to be used to correlate
    #  an SSOReady organization to your
    #  internal equivalent concept.
    #  External IDs are unique within an environment. No two organizations in the same
    #  environment can have
    #  the same external ID.
    # @param domains [Array<String>] A list of domains that users from this organization use.
    #  SAML connections and SCIM directories within this organization will only produce
    #  users whose email are included in
    #  `domains`. SSOReady will reject SAML and SCIM users that do not fall within
    #  `domains`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::Organization]
    def initialize(id: OMIT, environment_id: OMIT, display_name: OMIT, external_id: OMIT, domains: OMIT,
                   additional_properties: nil)
      @id = id if id != OMIT
      @environment_id = environment_id if environment_id != OMIT
      @display_name = display_name if display_name != OMIT
      @external_id = external_id if external_id != OMIT
      @domains = domains if domains != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "environmentId": environment_id,
        "displayName": display_name,
        "externalId": external_id,
        "domains": domains
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Organization
    #
    # @param json_object [String]
    # @return [SSOReady::Organization]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      id = struct["id"]
      environment_id = struct["environmentId"]
      display_name = struct["displayName"]
      external_id = struct["externalId"]
      domains = struct["domains"]
      new(
        id: id,
        environment_id: environment_id,
        display_name: display_name,
        external_id: external_id,
        domains: domains,
        additional_properties: struct
      )
    end

    # Serialize an instance of Organization to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.environment_id&.is_a?(String) != false || raise("Passed value for field obj.environment_id is not the expected type, validation failed.")
      obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.domains&.is_a?(Array) != false || raise("Passed value for field obj.domains is not the expected type, validation failed.")
    end
  end
end
