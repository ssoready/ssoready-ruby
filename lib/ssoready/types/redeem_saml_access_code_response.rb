# frozen_string_literal: true

require "ostruct"
require "json"

module SSOReady
  class RedeemSAMLAccessCodeResponse
    # @return [String] The user's email address.
    attr_reader :email
    # @return [String] The `state` you provided when getting a SAML initiation URL, if any.
    #  If your user logged in to your product using Identity Provider-initiated SAML
    #  (e.g. they clicked on your app inside
    #  their corporate Okta dashboard), then `state` will be empty.
    #  SSOReady validates the authenticity of non-empty `state` values. You do not need
    #  to implement your own CSRF on top
    #  of it, but doing so anyway will have no bad consequences.
    attr_reader :state
    # @return [Hash{String => String}] Arbitrary key-value pairs the Identity Provider included about the user.
    #  Typically, these `attributes` are used to pass along the user's first/last name,
    #  or whether they should be
    #  considered an admin within their company.
    attr_reader :attributes
    # @return [String] The ID of the organization this user belongs to.
    attr_reader :organization_id
    # @return [String] The `externalId`, if any, of the organization this user belongs to.
    attr_reader :organization_external_id
    # @return [String] A unique identifier of this particular SAML login. It is not a secret. You can
    #  safely log it.
    #  SSOReady maintains an audit log of every SAML login. Use this SAML flow ID to
    #  find this login in the audit logs.
    attr_reader :saml_flow_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [String] The user's email address.
    # @param state [String] The `state` you provided when getting a SAML initiation URL, if any.
    #  If your user logged in to your product using Identity Provider-initiated SAML
    #  (e.g. they clicked on your app inside
    #  their corporate Okta dashboard), then `state` will be empty.
    #  SSOReady validates the authenticity of non-empty `state` values. You do not need
    #  to implement your own CSRF on top
    #  of it, but doing so anyway will have no bad consequences.
    # @param attributes [Hash{String => String}] Arbitrary key-value pairs the Identity Provider included about the user.
    #  Typically, these `attributes` are used to pass along the user's first/last name,
    #  or whether they should be
    #  considered an admin within their company.
    # @param organization_id [String] The ID of the organization this user belongs to.
    # @param organization_external_id [String] The `externalId`, if any, of the organization this user belongs to.
    # @param saml_flow_id [String] A unique identifier of this particular SAML login. It is not a secret. You can
    #  safely log it.
    #  SSOReady maintains an audit log of every SAML login. Use this SAML flow ID to
    #  find this login in the audit logs.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::RedeemSAMLAccessCodeResponse]
    def initialize(email: OMIT, state: OMIT, attributes: OMIT, organization_id: OMIT, organization_external_id: OMIT,
                   saml_flow_id: OMIT, additional_properties: nil)
      @email = email if email != OMIT
      @state = state if state != OMIT
      @attributes = attributes if attributes != OMIT
      @organization_id = organization_id if organization_id != OMIT
      @organization_external_id = organization_external_id if organization_external_id != OMIT
      @saml_flow_id = saml_flow_id if saml_flow_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "email": email,
        "state": state,
        "attributes": attributes,
        "organizationId": organization_id,
        "organizationExternalId": organization_external_id,
        "samlFlowId": saml_flow_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RedeemSAMLAccessCodeResponse
    #
    # @param json_object [String]
    # @return [SSOReady::RedeemSAMLAccessCodeResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      state = parsed_json["state"]
      attributes = parsed_json["attributes"]
      organization_id = parsed_json["organizationId"]
      organization_external_id = parsed_json["organizationExternalId"]
      saml_flow_id = parsed_json["samlFlowId"]
      new(
        email: email,
        state: state,
        attributes: attributes,
        organization_id: organization_id,
        organization_external_id: organization_external_id,
        saml_flow_id: saml_flow_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of RedeemSAMLAccessCodeResponse to a JSON object
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
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.state&.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.attributes&.is_a?(Hash) != false || raise("Passed value for field obj.attributes is not the expected type, validation failed.")
      obj.organization_id&.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
      obj.organization_external_id&.is_a?(String) != false || raise("Passed value for field obj.organization_external_id is not the expected type, validation failed.")
      obj.saml_flow_id&.is_a?(String) != false || raise("Passed value for field obj.saml_flow_id is not the expected type, validation failed.")
    end
  end
end
