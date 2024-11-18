# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../types/create_setup_url_response"
require "async"

module SSOReady
  module Management
    class SetupURLsClient
      # @return [SSOReady::RequestClient]
      attr_reader :request_client

      # @param request_client [SSOReady::RequestClient]
      # @return [SSOReady::Management::SetupURLsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Creates a short-lived self-serve setup URL that you can send to your customer.
      #  Setup URLs let your customer configure their SAML settings, SCIM settings, or
      #  both.
      #
      # @param organization_id [String] The organization that the setup URL is for.
      # @param can_manage_saml [Boolean] Whether the setup URL lets the user manage SAML connections.
      # @param can_manage_scim [Boolean] Whether the setup URL lets the user manage SCIM directories.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::CreateSetupURLResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.setup_urls.create_setup_url
      def create_setup_url(organization_id: nil, can_manage_saml: nil, can_manage_scim: nil, request_options: nil)
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            organizationId: organization_id,
            canManageSaml: can_manage_saml,
            canManageScim: can_manage_scim
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/setup-urls"
        end
        SSOReady::CreateSetupURLResponse.from_json(json_object: response.body)
      end
    end

    class AsyncSetupURLsClient
      # @return [SSOReady::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [SSOReady::AsyncRequestClient]
      # @return [SSOReady::Management::AsyncSetupURLsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Creates a short-lived self-serve setup URL that you can send to your customer.
      #  Setup URLs let your customer configure their SAML settings, SCIM settings, or
      #  both.
      #
      # @param organization_id [String] The organization that the setup URL is for.
      # @param can_manage_saml [Boolean] Whether the setup URL lets the user manage SAML connections.
      # @param can_manage_scim [Boolean] Whether the setup URL lets the user manage SCIM directories.
      # @param request_options [SSOReady::RequestOptions]
      # @return [SSOReady::CreateSetupURLResponse]
      # @example
      #  api = SSOReady::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: SSOReady::Environment::DEFAULT,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.management.setup_urls.create_setup_url
      def create_setup_url(organization_id: nil, can_manage_saml: nil, can_manage_scim: nil, request_options: nil)
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
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              organizationId: organization_id,
              canManageSaml: can_manage_saml,
              canManageScim: can_manage_scim
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/v1/setup-urls"
          end
          SSOReady::CreateSetupURLResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
