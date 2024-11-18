# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/list_saml_connections_response"
require_relative "../../types/saml_connection"
require_relative "../../types/create_saml_connection_response"
require_relative "../../types/get_saml_connection_response"
require_relative "../../types/update_saml_connection_response"
require "async"

module SSOReady
  module Management
    class SAMLConnectionsClient
      # @return [SSOReady::RequestClient]
      attr_reader :request_client

      # @param request_client [SSOReady::RequestClient]
      # @return [SSOReady::Management::SAMLConnectionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Lists SAML connections in an organization.
      #
      # @param organization_id [String] The organization the SAML connections belong to.
      # @param page_token [String] Pagination token. Leave empty to get the first page of results.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::ListSAMLConnectionsResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.saml_connections.list_saml_connections
      def list_saml_connections(organization_id: nil, page_token: nil, request_options: nil)
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
            "organizationId": organization_id,
            "pageToken": page_token
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml-connections"
        end
        SSOReady::ListSAMLConnectionsResponse.from_json(json_object: response.body)
      end

      # Creates a SAML connection.
      #
      # @param request [Hash] Request of type SSOReady::SAMLConnection, as a Hash
      #   * :id (String)
      #   * :organization_id (String)
      #   * :primary (Boolean)
      #   * :idp_redirect_url (String)
      #   * :idp_certificate (String)
      #   * :idp_entity_id (String)
      #   * :sp_entity_id (String)
      #   * :sp_acs_url (String)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::CreateSAMLConnectionResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.saml_connections.create_saml_connection(request: {  })
      def create_saml_connection(request:, request_options: nil)
        response = @request_client.conn.post do |req|
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml-connections"
        end
        SSOReady::CreateSAMLConnectionResponse.from_json(json_object: response.body)
      end

      # Gets a SAML connection.
      #
      # @param id [String] ID of the SAML connection to get.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::GetSAMLConnectionResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.saml_connections.get_saml_connection(id: "id")
      def get_saml_connection(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml-connections/#{id}"
        end
        SSOReady::GetSAMLConnectionResponse.from_json(json_object: response.body)
      end

      # Updates a SAML connection.
      #
      # @param id [String] The ID of the SAML connection to update.
      # @param request [Hash] Request of type SSOReady::SAMLConnection, as a Hash
      #   * :id (String)
      #   * :organization_id (String)
      #   * :primary (Boolean)
      #   * :idp_redirect_url (String)
      #   * :idp_certificate (String)
      #   * :idp_entity_id (String)
      #   * :sp_entity_id (String)
      #   * :sp_acs_url (String)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::UpdateSAMLConnectionResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.saml_connections.update_saml_connection(id: "id", request: {  })
      def update_saml_connection(id:, request:, request_options: nil)
        response = @request_client.conn.patch do |req|
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml-connections/#{id}"
        end
        SSOReady::UpdateSAMLConnectionResponse.from_json(json_object: response.body)
      end
    end

    class AsyncSAMLConnectionsClient
      # @return [SSOReady::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [SSOReady::AsyncRequestClient]
      # @return [SSOReady::Management::AsyncSAMLConnectionsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Lists SAML connections in an organization.
      #
      # @param organization_id [String] The organization the SAML connections belong to.
      # @param page_token [String] Pagination token. Leave empty to get the first page of results.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::ListSAMLConnectionsResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.saml_connections.list_saml_connections
      def list_saml_connections(organization_id: nil, page_token: nil, request_options: nil)
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
              "organizationId": organization_id,
              "pageToken": page_token
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml-connections"
          end
          SSOReady::ListSAMLConnectionsResponse.from_json(json_object: response.body)
        end
      end

      # Creates a SAML connection.
      #
      # @param request [Hash] Request of type SSOReady::SAMLConnection, as a Hash
      #   * :id (String)
      #   * :organization_id (String)
      #   * :primary (Boolean)
      #   * :idp_redirect_url (String)
      #   * :idp_certificate (String)
      #   * :idp_entity_id (String)
      #   * :sp_entity_id (String)
      #   * :sp_acs_url (String)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::CreateSAMLConnectionResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.saml_connections.create_saml_connection(request: {  })
      def create_saml_connection(request:, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
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
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml-connections"
          end
          SSOReady::CreateSAMLConnectionResponse.from_json(json_object: response.body)
        end
      end

      # Gets a SAML connection.
      #
      # @param id [String] ID of the SAML connection to get.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::GetSAMLConnectionResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.saml_connections.get_saml_connection(id: "id")
      def get_saml_connection(id:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml-connections/#{id}"
          end
          SSOReady::GetSAMLConnectionResponse.from_json(json_object: response.body)
        end
      end

      # Updates a SAML connection.
      #
      # @param id [String] The ID of the SAML connection to update.
      # @param request [Hash] Request of type SSOReady::SAMLConnection, as a Hash
      #   * :id (String)
      #   * :organization_id (String)
      #   * :primary (Boolean)
      #   * :idp_redirect_url (String)
      #   * :idp_certificate (String)
      #   * :idp_entity_id (String)
      #   * :sp_entity_id (String)
      #   * :sp_acs_url (String)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::UpdateSAMLConnectionResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.saml_connections.update_saml_connection(id: "id", request: {  })
      def update_saml_connection(id:, request:, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
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
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml-connections/#{id}"
          end
          SSOReady::UpdateSAMLConnectionResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
