# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/list_organizations_response"
require_relative "../../types/organization"
require_relative "../../types/create_organization_response"
require_relative "../../types/get_organization_response"
require_relative "../../types/update_organization_response"
require "async"

module SSOReady
  module Management
    class OrganizationsClient
      # @return [SSOReady::RequestClient]
      attr_reader :request_client

      # @param request_client [SSOReady::RequestClient]
      # @return [SSOReady::Management::OrganizationsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Gets a list of organizations.
      #
      # @param page_token [String] Pagination token. Leave empty to get the first page of results.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::ListOrganizationsResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.organizations.list_organizations
      def list_organizations(page_token: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = { **(request_options&.additional_query_parameters || {}), "pageToken": page_token }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/organizations"
        end
        SSOReady::ListOrganizationsResponse.from_json(json_object: response.body)
      end

      # Creates an organization.
      #
      # @param request [Hash] Request of type SSOReady::Organization, as a Hash
      #   * :id (String)
      #   * :environment_id (String)
      #   * :display_name (String)
      #   * :external_id (String)
      #   * :domains (Array<String>)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::CreateOrganizationResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.organizations.create_organization(request: {  })
      def create_organization(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/organizations"
        end
        SSOReady::CreateOrganizationResponse.from_json(json_object: response.body)
      end

      # Gets an organization.
      #
      # @param id [String] ID of the organization to get.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::GetOrganizationResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.organizations.get_organization(id: "id")
      def get_organization(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/organizations/#{id}"
        end
        SSOReady::GetOrganizationResponse.from_json(json_object: response.body)
      end

      # Updates an organization.
      #
      # @param id [String] ID of the organization to update.
      # @param request [Hash] Request of type SSOReady::Organization, as a Hash
      #   * :id (String)
      #   * :environment_id (String)
      #   * :display_name (String)
      #   * :external_id (String)
      #   * :domains (Array<String>)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::UpdateOrganizationResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.organizations.update_organization(id: "id", request: {  })
      def update_organization(id:, request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/organizations/#{id}"
        end
        SSOReady::UpdateOrganizationResponse.from_json(json_object: response.body)
      end
    end

    class AsyncOrganizationsClient
      # @return [SSOReady::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [SSOReady::AsyncRequestClient]
      # @return [SSOReady::Management::AsyncOrganizationsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Gets a list of organizations.
      #
      # @param page_token [String] Pagination token. Leave empty to get the first page of results.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::ListOrganizationsResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.organizations.list_organizations
      def list_organizations(page_token: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = { **(request_options&.additional_query_parameters || {}), "pageToken": page_token }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/organizations"
          end
          SSOReady::ListOrganizationsResponse.from_json(json_object: response.body)
        end
      end

      # Creates an organization.
      #
      # @param request [Hash] Request of type SSOReady::Organization, as a Hash
      #   * :id (String)
      #   * :environment_id (String)
      #   * :display_name (String)
      #   * :external_id (String)
      #   * :domains (Array<String>)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::CreateOrganizationResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.organizations.create_organization(request: {  })
      def create_organization(request:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/organizations"
          end
          SSOReady::CreateOrganizationResponse.from_json(json_object: response.body)
        end
      end

      # Gets an organization.
      #
      # @param id [String] ID of the organization to get.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::GetOrganizationResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.organizations.get_organization(id: "id")
      def get_organization(id:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/organizations/#{id}"
          end
          SSOReady::GetOrganizationResponse.from_json(json_object: response.body)
        end
      end

      # Updates an organization.
      #
      # @param id [String] ID of the organization to update.
      # @param request [Hash] Request of type SSOReady::Organization, as a Hash
      #   * :id (String)
      #   * :environment_id (String)
      #   * :display_name (String)
      #   * :external_id (String)
      #   * :domains (Array<String>)
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::UpdateOrganizationResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.organizations.update_organization(id: "id", request: {  })
      def update_organization(id:, request:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/organizations/#{id}"
          end
          SSOReady::UpdateOrganizationResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
