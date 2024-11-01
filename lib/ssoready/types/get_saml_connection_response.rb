# frozen_string_literal: true

require_relative "saml_connection"
require "ostruct"
require "json"

module SSOReady
  class GetSAMLConnectionResponse
    # @return [SSOReady::SAMLConnection] The requested SAML connection.
    attr_reader :saml_connection
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param saml_connection [SSOReady::SAMLConnection] The requested SAML connection.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::GetSAMLConnectionResponse]
    def initialize(saml_connection: OMIT, additional_properties: nil)
      @saml_connection = saml_connection if saml_connection != OMIT
      @additional_properties = additional_properties
      @_field_set = { "samlConnection": saml_connection }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GetSAMLConnectionResponse
    #
    # @param json_object [String]
    # @return [SSOReady::GetSAMLConnectionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["samlConnection"].nil?
        saml_connection = nil
      else
        saml_connection = parsed_json["samlConnection"].to_json
        saml_connection = SSOReady::SAMLConnection.from_json(json_object: saml_connection)
      end
      new(saml_connection: saml_connection, additional_properties: struct)
    end

    # Serialize an instance of GetSAMLConnectionResponse to a JSON object
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
      obj.saml_connection.nil? || SSOReady::SAMLConnection.validate_raw(obj: obj.saml_connection)
    end
  end
end
