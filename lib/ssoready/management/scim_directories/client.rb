# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/list_scim_directories_response"
require_relative "../../types/scim_directory"
require_relative "../../types/create_scim_directory_response"
require_relative "../../types/get_scim_directory_response"
require_relative "../../types/update_scim_directory_response"
require_relative "../../types/rotate_scim_directory_bearer_token_response"
require "async"

module SSOReady
  module Management
    class SCIMDirectoriesClient
      # @return [SSOReady::RequestClient]
      attr_reader :request_client

      # @param request_client [SSOReady::RequestClient]
      # @return [SSOReady::Management::SCIMDirectoriesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Gets a list of SCIM directories in an organization.
      #
      # @param organization_id [String] The organization the SCIM directories belong to.
      # @param page_token [String] Pagination token. Leave empty to get the first page of results.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::ListSCIMDirectoriesResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    environment: SSOReady::Environment::DEFAULT,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.scim_directories.list_scim_directories
      def list_scim_directories(organization_id: nil, page_token: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "organizationId": organization_id,
            "pageToken": page_token
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim-directories"
        end
        SSOReady::ListSCIMDirectoriesResponse.from_json(json_object: response.body)
      end

      # Creates a SCIM directory.
      #
      # @param request [Hash] Request of type SSOReady::SCIMDirectory, as a Hash
      #   * :id (String)
      #   * :organization_id (String)
      #   * :primary (Boolean)
      #   * :scim_base_url (String)
      #   * :has_client_bearer_token (Boolean)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::CreateSCIMDirectoryResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    environment: SSOReady::Environment::DEFAULT,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.scim_directories.create_scim_directory(request: {  })
      def create_scim_directory(request:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim-directories"
        end
        SSOReady::CreateSCIMDirectoryResponse.from_json(json_object: response.body)
      end

      # Gets a SCIM directory.
      #
      # @param id [String] The ID of the SCIM directory.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::GetSCIMDirectoryResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    environment: SSOReady::Environment::DEFAULT,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.scim_directories.get_scim_directory(id: "id")
      def get_scim_directory(id:, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim-directories/#{id}"
        end
        SSOReady::GetSCIMDirectoryResponse.from_json(json_object: response.body)
      end

      # Updates a SCIM directory.
      #
      # @param id [String] The ID of the SCIM directory to update.
      # @param request [Hash] Request of type SSOReady::SCIMDirectory, as a Hash
      #   * :id (String)
      #   * :organization_id (String)
      #   * :primary (Boolean)
      #   * :scim_base_url (String)
      #   * :has_client_bearer_token (Boolean)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::UpdateSCIMDirectoryResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    environment: SSOReady::Environment::DEFAULT,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.scim_directories.update_scim_directory(id: "id", request: {  })
      def update_scim_directory(id:, request:, request_options: nil)
        response = @request_client.conn.patch do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim-directories/#{id}"
        end
        SSOReady::UpdateSCIMDirectoryResponse.from_json(json_object: response.body)
      end

      # Rotates a SCIM directory's bearer token.
      #  Every SCIM directory has a bearer token that SSOReady uses to authenticate
      #  requests sent from your customer's
      #  Identity Provider. These bearer tokens are assigned by SSOReady, and are secret.
      #  Newly-created SCIM directories do
      #  not have any bearer token at all; you must use this endpoint to get an initial
      #  value.
      #  Rotating a SCIM directory bearer token immediately invalidates the previous
      #  bearer token, if any. Your customer
      #  will need to update their SCIM configuration with the new value to make SCIM
      #  syncing work again.
      #  SSOReady only stores the hash of these bearer tokens. If your customer has lost
      #  their copy, you must use this
      #  endpoint to generate a new one.
      #
      # @param id [String] The ID of the SCIM directory whose bearer token to rotate.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::RotateSCIMDirectoryBearerTokenResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    environment: SSOReady::Environment::DEFAULT,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.scim_directories.rotate_scim_directory_bearer_token(id: "id")
      def rotate_scim_directory_bearer_token(id:, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim-directories/#{id}/rotate-bearer-token"
        end
        SSOReady::RotateSCIMDirectoryBearerTokenResponse.from_json(json_object: response.body)
      end
    end

    class AsyncSCIMDirectoriesClient
      # @return [SSOReady::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [SSOReady::AsyncRequestClient]
      # @return [SSOReady::Management::AsyncSCIMDirectoriesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Gets a list of SCIM directories in an organization.
      #
      # @param organization_id [String] The organization the SCIM directories belong to.
      # @param page_token [String] Pagination token. Leave empty to get the first page of results.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::ListSCIMDirectoriesResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    environment: SSOReady::Environment::DEFAULT,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.scim_directories.list_scim_directories
      def list_scim_directories(organization_id: nil, page_token: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "organizationId": organization_id,
              "pageToken": page_token
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim-directories"
          end
          SSOReady::ListSCIMDirectoriesResponse.from_json(json_object: response.body)
        end
      end

      # Creates a SCIM directory.
      #
      # @param request [Hash] Request of type SSOReady::SCIMDirectory, as a Hash
      #   * :id (String)
      #   * :organization_id (String)
      #   * :primary (Boolean)
      #   * :scim_base_url (String)
      #   * :has_client_bearer_token (Boolean)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::CreateSCIMDirectoryResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    environment: SSOReady::Environment::DEFAULT,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.scim_directories.create_scim_directory(request: {  })
      def create_scim_directory(request:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim-directories"
          end
          SSOReady::CreateSCIMDirectoryResponse.from_json(json_object: response.body)
        end
      end

      # Gets a SCIM directory.
      #
      # @param id [String] The ID of the SCIM directory.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::GetSCIMDirectoryResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    environment: SSOReady::Environment::DEFAULT,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.scim_directories.get_scim_directory(id: "id")
      def get_scim_directory(id:, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim-directories/#{id}"
          end
          SSOReady::GetSCIMDirectoryResponse.from_json(json_object: response.body)
        end
      end

      # Updates a SCIM directory.
      #
      # @param id [String] The ID of the SCIM directory to update.
      # @param request [Hash] Request of type SSOReady::SCIMDirectory, as a Hash
      #   * :id (String)
      #   * :organization_id (String)
      #   * :primary (Boolean)
      #   * :scim_base_url (String)
      #   * :has_client_bearer_token (Boolean)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::UpdateSCIMDirectoryResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    environment: SSOReady::Environment::DEFAULT,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.scim_directories.update_scim_directory(id: "id", request: {  })
      def update_scim_directory(id:, request:, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim-directories/#{id}"
          end
          SSOReady::UpdateSCIMDirectoryResponse.from_json(json_object: response.body)
        end
      end

      # Rotates a SCIM directory's bearer token.
      #  Every SCIM directory has a bearer token that SSOReady uses to authenticate
      #  requests sent from your customer's
      #  Identity Provider. These bearer tokens are assigned by SSOReady, and are secret.
      #  Newly-created SCIM directories do
      #  not have any bearer token at all; you must use this endpoint to get an initial
      #  value.
      #  Rotating a SCIM directory bearer token immediately invalidates the previous
      #  bearer token, if any. Your customer
      #  will need to update their SCIM configuration with the new value to make SCIM
      #  syncing work again.
      #  SSOReady only stores the hash of these bearer tokens. If your customer has lost
      #  their copy, you must use this
      #  endpoint to generate a new one.
      #
      # @param id [String] The ID of the SCIM directory whose bearer token to rotate.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::RotateSCIMDirectoryBearerTokenResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    environment: SSOReady::Environment::DEFAULT,
      #    base_url: "https://api.example.com",
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.scim_directories.rotate_scim_directory_bearer_token(id: "id")
      def rotate_scim_directory_bearer_token(id:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/scim-directories/#{id}/rotate-bearer-token"
          end
          SSOReady::RotateSCIMDirectoryBearerTokenResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
