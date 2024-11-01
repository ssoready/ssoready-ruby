# frozen_string_literal: true

require "ostruct"
require "json"

module SSOReady
  class SAMLConnection
    # @return [String] Unique identifier for this SAML connection.
    attr_reader :id
    # @return [String] The organization this SAML connection belongs to.
    attr_reader :organization_id
    # @return [Boolean] Whether this is the primary SAML connection for the organization.
    attr_reader :primary
    # @return [String] URL to redirect to when initiating SAML flows.
    #  IDP redirect URLs are assigned by an Identity Provider, and need to be inputted
    #  into SSOReady.
    attr_reader :idp_redirect_url
    # @return [String] Certificate to authenticate SAML assertions. This is a PEM-encoded X.509
    #  certificate.
    #  IDP certificates are assigned by an Identity Provider, and need to be inputted
    #  into SSOReady.
    attr_reader :idp_certificate
    # @return [String] Identifier for the identity provider when handling SAML operations.
    #  IDP entity IDs are assigned by an Identity Provider, and need to be inputted
    #  into SSOReady.
    attr_reader :idp_entity_id
    # @return [String] Identifier for the SAML connection when handling SAML operations.
    #  SP entity IDs are assigned by SSOReady, and need to be inputted into your
    #  customer's Identity Provider.
    attr_reader :sp_entity_id
    # @return [String] URL the Identity Provider redirects to when transmitting SAML assertions. Stands
    #  for "Service Provider Assertion
    #  Consumer Service" URL.
    #  SP ACS URLs are assigned by SSOReady, and need to be inputted into your
    #  customer's Identity Provider.
    attr_reader :sp_acs_url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for this SAML connection.
    # @param organization_id [String] The organization this SAML connection belongs to.
    # @param primary [Boolean] Whether this is the primary SAML connection for the organization.
    # @param idp_redirect_url [String] URL to redirect to when initiating SAML flows.
    #  IDP redirect URLs are assigned by an Identity Provider, and need to be inputted
    #  into SSOReady.
    # @param idp_certificate [String] Certificate to authenticate SAML assertions. This is a PEM-encoded X.509
    #  certificate.
    #  IDP certificates are assigned by an Identity Provider, and need to be inputted
    #  into SSOReady.
    # @param idp_entity_id [String] Identifier for the identity provider when handling SAML operations.
    #  IDP entity IDs are assigned by an Identity Provider, and need to be inputted
    #  into SSOReady.
    # @param sp_entity_id [String] Identifier for the SAML connection when handling SAML operations.
    #  SP entity IDs are assigned by SSOReady, and need to be inputted into your
    #  customer's Identity Provider.
    # @param sp_acs_url [String] URL the Identity Provider redirects to when transmitting SAML assertions. Stands
    #  for "Service Provider Assertion
    #  Consumer Service" URL.
    #  SP ACS URLs are assigned by SSOReady, and need to be inputted into your
    #  customer's Identity Provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::SAMLConnection]
    def initialize(id: OMIT, organization_id: OMIT, primary: OMIT, idp_redirect_url: OMIT, idp_certificate: OMIT,
                   idp_entity_id: OMIT, sp_entity_id: OMIT, sp_acs_url: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @organization_id = organization_id if organization_id != OMIT
      @primary = primary if primary != OMIT
      @idp_redirect_url = idp_redirect_url if idp_redirect_url != OMIT
      @idp_certificate = idp_certificate if idp_certificate != OMIT
      @idp_entity_id = idp_entity_id if idp_entity_id != OMIT
      @sp_entity_id = sp_entity_id if sp_entity_id != OMIT
      @sp_acs_url = sp_acs_url if sp_acs_url != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "organizationId": organization_id,
        "primary": primary,
        "idpRedirectUrl": idp_redirect_url,
        "idpCertificate": idp_certificate,
        "idpEntityId": idp_entity_id,
        "spEntityId": sp_entity_id,
        "spAcsUrl": sp_acs_url
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SAMLConnection
    #
    # @param json_object [String]
    # @return [SSOReady::SAMLConnection]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      id = struct["id"]
      organization_id = struct["organizationId"]
      primary = struct["primary"]
      idp_redirect_url = struct["idpRedirectUrl"]
      idp_certificate = struct["idpCertificate"]
      idp_entity_id = struct["idpEntityId"]
      sp_entity_id = struct["spEntityId"]
      sp_acs_url = struct["spAcsUrl"]
      new(
        id: id,
        organization_id: organization_id,
        primary: primary,
        idp_redirect_url: idp_redirect_url,
        idp_certificate: idp_certificate,
        idp_entity_id: idp_entity_id,
        sp_entity_id: sp_entity_id,
        sp_acs_url: sp_acs_url,
        additional_properties: struct
      )
    end

    # Serialize an instance of SAMLConnection to a JSON object
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
      obj.idp_redirect_url&.is_a?(String) != false || raise("Passed value for field obj.idp_redirect_url is not the expected type, validation failed.")
      obj.idp_certificate&.is_a?(String) != false || raise("Passed value for field obj.idp_certificate is not the expected type, validation failed.")
      obj.idp_entity_id&.is_a?(String) != false || raise("Passed value for field obj.idp_entity_id is not the expected type, validation failed.")
      obj.sp_entity_id&.is_a?(String) != false || raise("Passed value for field obj.sp_entity_id is not the expected type, validation failed.")
      obj.sp_acs_url&.is_a?(String) != false || raise("Passed value for field obj.sp_acs_url is not the expected type, validation failed.")
    end
  end
end
