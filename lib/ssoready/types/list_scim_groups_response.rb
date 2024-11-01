# frozen_string_literal: true

require_relative "scim_group"
require "ostruct"
require "json"

module SSOReady
  class ListSCIMGroupsResponse
    # @return [Array<SSOReady::SCIMGroup>] List of SCIM groups.
    attr_reader :scim_groups
    # @return [String] Value to use as `pageToken` for the next page of data. Empty if there is no more
    #  data.
    attr_reader :next_page_token
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scim_groups [Array<SSOReady::SCIMGroup>] List of SCIM groups.
    # @param next_page_token [String] Value to use as `pageToken` for the next page of data. Empty if there is no more
    #  data.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::ListSCIMGroupsResponse]
    def initialize(scim_groups: OMIT, next_page_token: OMIT, additional_properties: nil)
      @scim_groups = scim_groups if scim_groups != OMIT
      @next_page_token = next_page_token if next_page_token != OMIT
      @additional_properties = additional_properties
      @_field_set = { "scimGroups": scim_groups, "nextPageToken": next_page_token }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ListSCIMGroupsResponse
    #
    # @param json_object [String]
    # @return [SSOReady::ListSCIMGroupsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      scim_groups = parsed_json["scimGroups"]&.map do |v|
        v = v.to_json
        SSOReady::SCIMGroup.from_json(json_object: v)
      end
      next_page_token = struct["nextPageToken"]
      new(
        scim_groups: scim_groups,
        next_page_token: next_page_token,
        additional_properties: struct
      )
    end

    # Serialize an instance of ListSCIMGroupsResponse to a JSON object
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
      obj.scim_groups&.is_a?(Array) != false || raise("Passed value for field obj.scim_groups is not the expected type, validation failed.")
      obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
    end
  end
end
