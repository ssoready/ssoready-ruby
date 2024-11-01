# frozen_string_literal: true

require_relative "google_protobuf_any"
require "ostruct"
require "json"

module SSOReady
  # The `Status` type defines a logical error model that is suitable for different
  #  programming environments, including REST APIs and RPC APIs. It is used by
  #  [gRPC](https://github.com/grpc). Each `Status` message contains three pieces of
  #  data: error code, error message, and error details. You can find out more about
  #  this error model and how to work with it in the [API Design
  #  Guide](https://cloud.google.com/apis/design/errors).
  class Status
    # @return [Integer] The status code, which should be an enum value of
    #  [google.rpc.Code][google.rpc.code].
    attr_reader :code
    # @return [String] A developer-facing error message, which should be in English. Any user-facing
    #  error message should be localized and sent in the
    #  [google.rpc.Status.details][google.rpc.status.details] field, or localized by
    #  the client.
    attr_reader :message
    # @return [Array<SSOReady::GoogleProtobufAny>] A list of messages that carry the error details. There is a common set of
    #  message types for APIs to use.
    attr_reader :details
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param code [Integer] The status code, which should be an enum value of
    #  [google.rpc.Code][google.rpc.code].
    # @param message [String] A developer-facing error message, which should be in English. Any user-facing
    #  error message should be localized and sent in the
    #  [google.rpc.Status.details][google.rpc.status.details] field, or localized by
    #  the client.
    # @param details [Array<SSOReady::GoogleProtobufAny>] A list of messages that carry the error details. There is a common set of
    #  message types for APIs to use.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SSOReady::Status]
    def initialize(code: OMIT, message: OMIT, details: OMIT, additional_properties: nil)
      @code = code if code != OMIT
      @message = message if message != OMIT
      @details = details if details != OMIT
      @additional_properties = additional_properties
      @_field_set = { "code": code, "message": message, "details": details }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Status
    #
    # @param json_object [String]
    # @return [SSOReady::Status]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      code = struct["code"]
      message = struct["message"]
      details = parsed_json["details"]&.map do |v|
        v = v.to_json
        SSOReady::GoogleProtobufAny.from_json(json_object: v)
      end
      new(
        code: code,
        message: message,
        details: details,
        additional_properties: struct
      )
    end

    # Serialize an instance of Status to a JSON object
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
      obj.code&.is_a?(Integer) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.details&.is_a?(Array) != false || raise("Passed value for field obj.details is not the expected type, validation failed.")
    end
  end
end
