# frozen_string_literal: true

require "ostruct"
require "json"

module SSOReady
  class SCIMDirectory
    # @return [String] Unique identifier for this SCIM directory.
    attr_reader :id
    # @return [String] The organization this SCIM directory belongs to.
    attr_reader :organization_id
    # @return [Boolean] Whether this is the primary SCIM directory for the organization.
    attr_reader :primary
    # @return [String] Base URL the Identity Provider uses to perform SCIM HTTP requests.
    #  SCIM base URLs are assigned by SSOReady, and need to be inputted into your
    #  customer's Identity Provider.
    attr_reader :scim_base_url
    # @return [Boolean] Whether this SCIM directory has a bearer token assigned.
    #  SSOReady only stores a hash of the bearer token. To get a bearer token value,
    #  you must rotate this SCIM directory's
    #  bearer token.
    attr_reader :has_client_bearer_token
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for this SCIM directory.
    # @param organization_id [String] The organization this SCIM directory belongs to.
    # @param primary [Boolean] Whether this is the primary SCIM directory for the organization.
    # @param scim_base_url [String] Base URL the Identity Provider uses to perform SCIM HTTP requests.
    #  SCIM base URLs are assigned by SSOReady, and need to be inputted into your
    #  customer's Identity Provider.
    # @param has_client_bearer_token [Boolean] Whether this SCIM directory has a bearer token assigned.
    #  SSOReady only stores a hash of the bearer token. To get a bearer token value,
    #  you must rotate this SCIM directory's
    #  bearer token.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::SCIMDirectory]
    def initialize(id: OMIT, organization_id: OMIT, primary: OMIT, scim_base_url: OMIT, has_client_bearer_token: OMIT,
                   additional_properties: nil)
      @id = id if id != OMIT
      @organization_id = organization_id if organization_id != OMIT
      @primary = primary if primary != OMIT
      @scim_base_url = scim_base_url if scim_base_url != OMIT
      @has_client_bearer_token = has_client_bearer_token if has_client_bearer_token != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "organizationId": organization_id,
        "primary": primary,
        "scimBaseUrl": scim_base_url,
        "hasClientBearerToken": has_client_bearer_token
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SCIMDirectory
    #
    # @param json_object [String]
    # @return [SSOReady::SCIMDirectory]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      id = struct["id"]
      organization_id = struct["organizationId"]
      primary = struct["primary"]
      scim_base_url = struct["scimBaseUrl"]
      has_client_bearer_token = struct["hasClientBearerToken"]
      new(
        id: id,
        organization_id: organization_id,
        primary: primary,
        scim_base_url: scim_base_url,
        has_client_bearer_token: has_client_bearer_token,
        additional_properties: struct
      )
    end

    # Serialize an instance of SCIMDirectory to a JSON object
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
      obj.organization_id&.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
      obj.primary&.is_a?(Boolean) != false || raise("Passed value for field obj.primary is not the expected type, validation failed.")
      obj.scim_base_url&.is_a?(String) != false || raise("Passed value for field obj.scim_base_url is not the expected type, validation failed.")
      obj.has_client_bearer_token&.is_a?(Boolean) != false || raise("Passed value for field obj.has_client_bearer_token is not the expected type, validation failed.")
    end
  end
end
