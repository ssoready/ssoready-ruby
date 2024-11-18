# frozen_string_literal: true

require "ostruct"
require "json"

module SSOReady
  class RotateSCIMDirectoryBearerTokenResponse
    # @return [String] The new, updated bearer token.
    #  Do not log or store this bearer token. It is an authentication token that your
    #  customer should securely input into
    #  their Identity Provider.
    attr_reader :bearer_token
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param bearer_token [String] The new, updated bearer token.
    #  Do not log or store this bearer token. It is an authentication token that your
    #  customer should securely input into
    #  their Identity Provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::RotateSCIMDirectoryBearerTokenResponse]
    def initialize(bearer_token: OMIT, additional_properties: nil)
      @bearer_token = bearer_token if bearer_token != OMIT
      @additional_properties = additional_properties
      @_field_set = { "bearerToken": bearer_token }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  RotateSCIMDirectoryBearerTokenResponse
    #
    # @param json_object [String]
    # @return [SSOReady::RotateSCIMDirectoryBearerTokenResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      bearer_token = parsed_json["bearerToken"]
      new(bearer_token: bearer_token, additional_properties: struct)
    end

    # Serialize an instance of RotateSCIMDirectoryBearerTokenResponse to a JSON object
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
      obj.bearer_token&.is_a?(String) != false || raise("Passed value for field obj.bearer_token is not the expected type, validation failed.")
    end
  end
end
