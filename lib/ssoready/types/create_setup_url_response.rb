# frozen_string_literal: true

require "ostruct"
require "json"

module SSOReady
  class CreateSetupURLResponse
    # @return [String] The one-time, short-lived self-serve setup URL.
    #  Do not log or store this URL. Because this URL is one-time, loading it yourself
    #  means your customer will not be
    #  able to load it after you.
    attr_reader :url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param url [String] The one-time, short-lived self-serve setup URL.
    #  Do not log or store this URL. Because this URL is one-time, loading it yourself
    #  means your customer will not be
    #  able to load it after you.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::CreateSetupURLResponse]
    def initialize(url: OMIT, additional_properties: nil)
      @url = url if url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "url": url }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateSetupURLResponse
    #
    # @param json_object [String]
    # @return [SSOReady::CreateSetupURLResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      url = struct["url"]
      new(url: url, additional_properties: struct)
    end

    # Serialize an instance of CreateSetupURLResponse to a JSON object
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
      obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end
