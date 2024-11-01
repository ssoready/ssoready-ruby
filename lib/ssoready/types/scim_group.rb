# frozen_string_literal: true

require "ostruct"
require "json"

module SSOReady
  class SCIMGroup
    # @return [String] Unique identifier for this SCIM group.
    attr_reader :id
    # @return [String] SCIM directory this SCIM group belongs to.
    attr_reader :scim_directory_id
    # @return [String] A human-friendly name for the SCIM group.
    attr_reader :display_name
    # @return [Boolean] Whether the SCIM group has been deleted or deprovisioned from its SCIM
    #  directory.
    #  Identity Providers are inconsistent about reliably deleting SCIM groups. Many
    #  Identity Providers will deprovision
    #  the users inside a group, but not the group itself. For this reason, it's
    #  typical to ignore this field until a
    #  specific need arises.
    attr_reader :deleted
    # @return [Hash{String => Object}] Arbitrary, potentially nested, attributes the Identity Provider included about
    #  the group.
    #  Identity Providers are inconsistent about supporting sending custom attributes
    #  on groups. For this reason, it's
    #  typical to not rely on them until a specific need arises.
    attr_reader :attributes
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] Unique identifier for this SCIM group.
    # @param scim_directory_id [String] SCIM directory this SCIM group belongs to.
    # @param display_name [String] A human-friendly name for the SCIM group.
    # @param deleted [Boolean] Whether the SCIM group has been deleted or deprovisioned from its SCIM
    #  directory.
    #  Identity Providers are inconsistent about reliably deleting SCIM groups. Many
    #  Identity Providers will deprovision
    #  the users inside a group, but not the group itself. For this reason, it's
    #  typical to ignore this field until a
    #  specific need arises.
    # @param attributes [Hash{String => Object}] Arbitrary, potentially nested, attributes the Identity Provider included about
    #  the group.
    #  Identity Providers are inconsistent about supporting sending custom attributes
    #  on groups. For this reason, it's
    #  typical to not rely on them until a specific need arises.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::SCIMGroup]
    def initialize(id: OMIT, scim_directory_id: OMIT, display_name: OMIT, deleted: OMIT, attributes: OMIT,
                   additional_properties: nil)
      @id = id if id != OMIT
      @scim_directory_id = scim_directory_id if scim_directory_id != OMIT
      @display_name = display_name if display_name != OMIT
      @deleted = deleted if deleted != OMIT
      @attributes = attributes if attributes != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "scimDirectoryId": scim_directory_id,
        "displayName": display_name,
        "deleted": deleted,
        "attributes": attributes
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SCIMGroup
    #
    # @param json_object [String]
    # @return [SSOReady::SCIMGroup]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      id = struct["id"]
      scim_directory_id = struct["scimDirectoryId"]
      display_name = struct["displayName"]
      deleted = struct["deleted"]
      attributes = struct["attributes"]
      new(
        id: id,
        scim_directory_id: scim_directory_id,
        display_name: display_name,
        deleted: deleted,
        attributes: attributes,
        additional_properties: struct
      )
    end

    # Serialize an instance of SCIMGroup to a JSON object
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
      obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
      obj.deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.deleted is not the expected type, validation failed.")
      obj.attributes&.is_a?(Hash) != false || raise("Passed value for field obj.attributes is not the expected type, validation failed.")
    end
  end
end
