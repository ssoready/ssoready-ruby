# frozen_string_literal: true

require "ostruct"
require "json"

module SSOReady
  class GetSAMLRedirectURLResponse
    # @return [String] Redirect your user to this URL to start a SAML login.
    attr_reader :redirect_url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param redirect_url [String] Redirect your user to this URL to start a SAML login.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::GetSAMLRedirectURLResponse]
    def initialize(redirect_url: OMIT, additional_properties: nil)
      @redirect_url = redirect_url if redirect_url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "redirectUrl": redirect_url }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GetSAMLRedirectURLResponse
    #
    # @param json_object [String]
    # @return [SSOReady::GetSAMLRedirectURLResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      redirect_url = struct["redirectUrl"]
      new(redirect_url: redirect_url, additional_properties: struct)
    end

    # Serialize an instance of GetSAMLRedirectURLResponse to a JSON object
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
      obj.redirect_url&.is_a?(String) != false || raise("Passed value for field obj.redirect_url is not the expected type, validation failed.")
    end
  end
end
