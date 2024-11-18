# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/list_scim_groups_response"
require_relative "../types/get_scim_group_response"
require_relative "../types/list_scim_users_response"
require_relative "../types/get_scim_user_response"
require "async"

module SSOReady
  class SCIMClient
    # @return [SSOReady::RequestClient]
    attr_reader :request_client

    # @param request_client [SSOReady::RequestClient]
    # @return [SSOReady::SCIMClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Gets a list of SCIM groups in a SCIM directory.
    #
    # @param scim_directory_id [String] The SCIM directory to list from.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param organization_id [String] The ID of the organization to list from. The primary SCIM directory of this
    #  organization is used.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param organization_external_id [String] The `externalId` of the organization to list from. The primary SCIM directory of
    #  this organization is used.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param page_token [String] Pagination token. Leave empty to get the first page of results.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::ListSCIMGroupsResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: SSOReady::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.scim.list_scim_groups(organization_external_id: "my_custom_external_id")
    def list_scim_groups(scim_directory_id: nil, organization_id: nil, organization_external_id: nil, page_token: nil,
                         request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "scimDirectoryId": scim_directory_id,
          "organizationId": organization_id,
          "organizationExternalId": organization_external_id,
          "pageToken": page_token
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim/groups"
      end
      SSOReady::ListSCIMGroupsResponse.from_json(json_object: response.body)
    end

    # Gets a SCIM group in a SCIM directory.
    #
    # @param id [String] ID of the SCIM group to get.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::GetSCIMGroupResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: SSOReady::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.scim.get_scim_group(id: "scim_group_...")
    def get_scim_group(id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim/groups/#{id}"
      end
      SSOReady::GetSCIMGroupResponse.from_json(json_object: response.body)
    end

    # Gets a list of SCIM users in a SCIM directory.
    #
    # @param scim_directory_id [String] The SCIM directory to list from.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param organization_id [String] The ID of the organization to list from. The primary SCIM directory of this
    #  organization is used.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param organization_external_id [String] The `externalId` of the organization to list from. The primary SCIM directory of
    #  this organization is used.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param scim_group_id [String] If specified, only users that are members of this SCIM group are returned.
    # @param page_token [String] Pagination token. Leave empty to get the first page of results.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::ListSCIMUsersResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: SSOReady::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.scim.list_scim_users(organization_external_id: "my_custom_external_id")
    def list_scim_users(scim_directory_id: nil, organization_id: nil, organization_external_id: nil,
                        scim_group_id: nil, page_token: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "scimDirectoryId": scim_directory_id,
          "organizationId": organization_id,
          "organizationExternalId": organization_external_id,
          "scimGroupId": scim_group_id,
          "pageToken": page_token
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim/users"
      end
      SSOReady::ListSCIMUsersResponse.from_json(json_object: response.body)
    end

    # Gets a SCIM user.
    #
    # @param id [String] ID of the SCIM user to get.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::GetSCIMUserResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: SSOReady::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.scim.get_scim_user(id: "scim_user_...")
    def get_scim_user(id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim/users/#{id}"
      end
      SSOReady::GetSCIMUserResponse.from_json(json_object: response.body)
    end
  end

  class AsyncSCIMClient
    # @return [SSOReady::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [SSOReady::AsyncRequestClient]
    # @return [SSOReady::AsyncSCIMClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Gets a list of SCIM groups in a SCIM directory.
    #
    # @param scim_directory_id [String] The SCIM directory to list from.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param organization_id [String] The ID of the organization to list from. The primary SCIM directory of this
    #  organization is used.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param organization_external_id [String] The `externalId` of the organization to list from. The primary SCIM directory of
    #  this organization is used.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param page_token [String] Pagination token. Leave empty to get the first page of results.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::ListSCIMGroupsResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: SSOReady::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.scim.list_scim_groups(organization_external_id: "my_custom_external_id")
    def list_scim_groups(scim_directory_id: nil, organization_id: nil, organization_external_id: nil, page_token: nil,
                         request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "scimDirectoryId": scim_directory_id,
            "organizationId": organization_id,
            "organizationExternalId": organization_external_id,
            "pageToken": page_token
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim/groups"
        end
        SSOReady::ListSCIMGroupsResponse.from_json(json_object: response.body)
      end
    end

    # Gets a SCIM group in a SCIM directory.
    #
    # @param id [String] ID of the SCIM group to get.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::GetSCIMGroupResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: SSOReady::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.scim.get_scim_group(id: "scim_group_...")
    def get_scim_group(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim/groups/#{id}"
        end
        SSOReady::GetSCIMGroupResponse.from_json(json_object: response.body)
      end
    end

    # Gets a list of SCIM users in a SCIM directory.
    #
    # @param scim_directory_id [String] The SCIM directory to list from.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param organization_id [String] The ID of the organization to list from. The primary SCIM directory of this
    #  organization is used.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param organization_external_id [String] The `externalId` of the organization to list from. The primary SCIM directory of
    #  this organization is used.
    #  One of `scimDirectoryId`, `organizationId`, or `organizationExternalId` must be
    #  specified.
    # @param scim_group_id [String] If specified, only users that are members of this SCIM group are returned.
    # @param page_token [String] Pagination token. Leave empty to get the first page of results.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::ListSCIMUsersResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: SSOReady::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.scim.list_scim_users(organization_external_id: "my_custom_external_id")
    def list_scim_users(scim_directory_id: nil, organization_id: nil, organization_external_id: nil,
                        scim_group_id: nil, page_token: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "scimDirectoryId": scim_directory_id,
            "organizationId": organization_id,
            "organizationExternalId": organization_external_id,
            "scimGroupId": scim_group_id,
            "pageToken": page_token
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim/users"
        end
        SSOReady::ListSCIMUsersResponse.from_json(json_object: response.body)
      end
    end

    # Gets a SCIM user.
    #
    # @param id [String] ID of the SCIM user to get.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::GetSCIMUserResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: SSOReady::Environment::DEFAULT,
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.scim.get_scim_user(id: "scim_user_...")
    def get_scim_user(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim/users/#{id}"
        end
        SSOReady::GetSCIMUserResponse.from_json(json_object: response.body)
      end
    end
  end
end
