# frozen_string_literal: true

require "ostruct"
require "json"

module SSOReady
  class SCIMUser
    # @return [String] Unique identifier for this SCIM user.
    attr_reader :id
    # @return [String] SCIM directory this SCIM user belongs to.
    attr_reader :scim_directory_id
    # @return [String] The SCIM user's email address.
    attr_reader :email
    # @return [Boolean] Whether the SCIM user has been deleted or deprovisioned from its SCIM directory.
    attr_reader :deleted
    # @return [Hash{String => Object}] Arbitrary, potentially nested, attributes the Identity Provider included about
    #  the user.
    #  Typically, these `attributes` are used to pass along the user's first/last name,
    #  or whether they should be
    #  considered an admin within their company.
    attr_reader :attributes
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for this SCIM user.
    # @param scim_directory_id [String] SCIM directory this SCIM user belongs to.
    # @param email [String] The SCIM user's email address.
    # @param deleted [Boolean] Whether the SCIM user has been deleted or deprovisioned from its SCIM directory.
    # @param attributes [Hash{String => Object}] Arbitrary, potentially nested, attributes the Identity Provider included about
    #  the user.
    #  Typically, these `attributes` are used to pass along the user's first/last name,
    #  or whether they should be
    #  considered an admin within their company.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::SCIMUser]
    def initialize(id: OMIT, scim_directory_id: OMIT, email: OMIT, deleted: OMIT, attributes: OMIT,
                   additional_properties: nil)
      @id = id if id != OMIT
      @scim_directory_id = scim_directory_id if scim_directory_id != OMIT
      @email = email if email != OMIT
      @deleted = deleted if deleted != OMIT
      @attributes = attributes if attributes != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "scimDirectoryId": scim_directory_id,
        "email": email,
        "deleted": deleted,
        "attributes": attributes
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SCIMUser
    #
    # @param json_object [String]
    # @return [SSOReady::SCIMUser]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      id = struct["id"]
      scim_directory_id = struct["scimDirectoryId"]
      email = struct["email"]
      deleted = struct["deleted"]
      attributes = struct["attributes"]
      new(
        id: id,
        scim_directory_id: scim_directory_id,
        email: email,
        deleted: deleted,
        attributes: attributes,
        additional_properties: struct
      )
    end

    # Serialize an instance of SCIMUser to a JSON object
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
      obj.scim_directory_id&.is_a?(String) != false || raise("Passed value for field obj.scim_directory_id is not the expected type, validation failed.")
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.deleted is not the expected type, validation failed.")
      obj.attributes&.is_a?(Hash) != false || raise("Passed value for field obj.attributes is not the expected type, validation failed.")
    end
  end
end
