# frozen_string_literal: true

require_relative "scim_user"
require "ostruct"
require "json"

module SSOReady
  class ListSCIMUsersResponse
    # @return [Array<SSOReady::SCIMUser>] List of SCIM users.
    attr_reader :scim_users
    # @return [String] Value to use as `pageToken` for the next page of data. Empty if there is no more
    #  data.
    attr_reader :next_page_token
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scim_users [Array<SSOReady::SCIMUser>] List of SCIM users.
    # @param next_page_token [String] Value to use as `pageToken` for the next page of data. Empty if there is no more
    #  data.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::ListSCIMUsersResponse]
    def initialize(scim_users: OMIT, next_page_token: OMIT, additional_properties: nil)
      @scim_users = scim_users if scim_users != OMIT
      @next_page_token = next_page_token if next_page_token != OMIT
      @additional_properties = additional_properties
      @_field_set = { "scimUsers": scim_users, "nextPageToken": next_page_token }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ListSCIMUsersResponse
    #
    # @param json_object [String]
    # @return [SSOReady::ListSCIMUsersResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      scim_users = parsed_json["scimUsers"]&.map do |v|
        v = v.to_json
        SSOReady::SCIMUser.from_json(json_object: v)
      end
      next_page_token = struct["nextPageToken"]
      new(
        scim_users: scim_users,
        next_page_token: next_page_token,
        additional_properties: struct
      )
    end

    # Serialize an instance of ListSCIMUsersResponse to a JSON object
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
      obj.scim_users&.is_a?(Array) != false || raise("Passed value for field obj.scim_users is not the expected type, validation failed.")
      obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
    end
  end
end
