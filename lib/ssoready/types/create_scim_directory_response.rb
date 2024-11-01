# frozen_string_literal: true

require_relative "scim_directory"
require "ostruct"
require "json"

module SSOReady
  class CreateSCIMDirectoryResponse
    # @return [SSOReady::SCIMDirectory] The updated SCIM directory.
    attr_reader :scim_directory
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scim_directory [SSOReady::SCIMDirectory] The updated SCIM directory.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::CreateSCIMDirectoryResponse]
    def initialize(scim_directory: OMIT, additional_properties: nil)
      @scim_directory = scim_directory if scim_directory != OMIT
      @additional_properties = additional_properties
      @_field_set = { "scimDirectory": scim_directory }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateSCIMDirectoryResponse
    #
    # @param json_object [String]
    # @return [SSOReady::CreateSCIMDirectoryResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["scimDirectory"].nil?
        scim_directory = nil
      else
        scim_directory = parsed_json["scimDirectory"].to_json
        scim_directory = SSOReady::SCIMDirectory.from_json(json_object: scim_directory)
      end
      new(scim_directory: scim_directory, additional_properties: struct)
    end

    # Serialize an instance of CreateSCIMDirectoryResponse to a JSON object
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
      obj.scim_directory.nil? || SSOReady::SCIMDirectory.validate_raw(obj: obj.scim_directory)
    end
  end
end
