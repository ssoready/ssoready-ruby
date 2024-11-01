# frozen_string_literal: true

require_relative "organization"
require "ostruct"
require "json"

module SSOReady
  class ListOrganizationsResponse
    # @return [Array<SSOReady::Organization>] List of organizations.
    attr_reader :organizations
    # @return [String] Value to use as `pageToken` for the next page of data. Empty if there is no more
    #  data.
    attr_reader :next_page_token
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param organizations [Array<SSOReady::Organization>] List of organizations.
    # @param next_page_token [String] Value to use as `pageToken` for the next page of data. Empty if there is no more
    #  data.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::ListOrganizationsResponse]
    def initialize(organizations: OMIT, next_page_token: OMIT, additional_properties: nil)
      @organizations = organizations if organizations != OMIT
      @next_page_token = next_page_token if next_page_token != OMIT
      @additional_properties = additional_properties
      @_field_set = { "organizations": organizations, "nextPageToken": next_page_token }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ListOrganizationsResponse
    #
    # @param json_object [String]
    # @return [SSOReady::ListOrganizationsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      organizations = parsed_json["organizations"]&.map do |v|
        v = v.to_json
        SSOReady::Organization.from_json(json_object: v)
      end
      next_page_token = struct["nextPageToken"]
      new(
        organizations: organizations,
        next_page_token: next_page_token,
        additional_properties: struct
      )
    end

    # Serialize an instance of ListOrganizationsResponse to a JSON object
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
      obj.organizations&.is_a?(Array) != false || raise("Passed value for field obj.organizations is not the expected type, validation failed.")
      obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
    end
  end
end
