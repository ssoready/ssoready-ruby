# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/redeem_saml_access_code_response"
require_relative "../types/get_saml_redirect_url_response"
require "async"

module SSOReady
  class SAMLClient
    # @return [SSOReady::RequestClient]
    attr_reader :request_client

    # @param request_client [SSOReady::RequestClient]
    # @return [SSOReady::SAMLClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Exchanges a SAML access code for details about your user's SAML login details.
    #
    # @param saml_access_code [String] The SAML access code to redeem.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::RedeemSAMLAccessCodeResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    environment: SSOReady::Environment::DEFAULT,
    #    base_url: "https://api.example.com",
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.saml.redeem_saml_access_code(saml_access_code: "saml_access_code_...")
    def redeem_saml_access_code(saml_access_code: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request_options&.additional_body_parameters || {}), samlAccessCode: saml_access_code }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml/redeem"
      end
      SSOReady::RedeemSAMLAccessCodeResponse.from_json(json_object: response.body)
    end

    # Gets a SAML initiation URL to redirect your users to.
    #
    # @param saml_connection_id [String] The SAML connection to start a SAML login for.
    #  One of `samlConnectionId`, `organizationId`, or `organizationExternalId` must
    #  be specified.
    # @param organization_id [String] The ID of the organization to start a SAML login for.
    #  The primary SAML connection in this organization will be used for logins.
    #  One of `samlConnectionId`, `organizationId`, or `organizationExternalId` must
    #  be specified.
    # @param organization_external_id [String] The `externalId` of the organization to start a SAML login for.
    #  The primary SAML connection in this organization will be used for logins.
    #  One of `samlConnectionId`, `organizationId`, or `organizationExternalId` must
    #  be specified.
    # @param state [String] This string will be returned back to you when you redeem this login's SAML
    #  access code.
    #  You can do anything you like with this `state`, but the most common use-case is
    #  to keep track of where to redirect
    #  your user back to after logging in with SAML.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::GetSAMLRedirectURLResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    environment: SSOReady::Environment::DEFAULT,
    #    base_url: "https://api.example.com",
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.saml.get_saml_redirect_url(organization_external_id: "my_custom_external_id")
    def get_saml_redirect_url(saml_connection_id: nil, organization_id: nil, organization_external_id: nil, state: nil,
                              request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          samlConnectionId: saml_connection_id,
          organizationId: organization_id,
          organizationExternalId: organization_external_id,
          state: state
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml/redirect"
      end
      SSOReady::GetSAMLRedirectURLResponse.from_json(json_object: response.body)
    end
  end

  class AsyncSAMLClient
    # @return [SSOReady::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [SSOReady::AsyncRequestClient]
    # @return [SSOReady::AsyncSAMLClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # Exchanges a SAML access code for details about your user's SAML login details.
    #
    # @param saml_access_code [String] The SAML access code to redeem.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::RedeemSAMLAccessCodeResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    environment: SSOReady::Environment::DEFAULT,
    #    base_url: "https://api.example.com",
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.saml.redeem_saml_access_code(saml_access_code: "saml_access_code_...")
    def redeem_saml_access_code(saml_access_code: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), samlAccessCode: saml_access_code }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml/redeem"
        end
        SSOReady::RedeemSAMLAccessCodeResponse.from_json(json_object: response.body)
      end
    end

    # Gets a SAML initiation URL to redirect your users to.
    #
    # @param saml_connection_id [String] The SAML connection to start a SAML login for.
    #  One of `samlConnectionId`, `organizationId`, or `organizationExternalId` must
    #  be specified.
    # @param organization_id [String] The ID of the organization to start a SAML login for.
    #  The primary SAML connection in this organization will be used for logins.
    #  One of `samlConnectionId`, `organizationId`, or `organizationExternalId` must
    #  be specified.
    # @param organization_external_id [String] The `externalId` of the organization to start a SAML login for.
    #  The primary SAML connection in this organization will be used for logins.
    #  One of `samlConnectionId`, `organizationId`, or `organizationExternalId` must
    #  be specified.
    # @param state [String] This string will be returned back to you when you redeem this login's SAML
    #  access code.
    #  You can do anything you like with this `state`, but the most common use-case is
    #  to keep track of where to redirect
    #  your user back to after logging in with SAML.
    # @param request_options [SSOReady::RequestOptions]
    # @return [SSOReady::GetSAMLRedirectURLResponse]
    # @example
    #  api = SSOReady::Client.new(
    #    environment: SSOReady::Environment::DEFAULT,
    #    base_url: "https://api.example.com",
    #    api_key: "YOUR_AUTH_TOKEN"
    #  )
    #  api.saml.get_saml_redirect_url(organization_external_id: "my_custom_external_id")
    def get_saml_redirect_url(saml_connection_id: nil, organization_id: nil, organization_external_id: nil, state: nil,
                              request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            samlConnectionId: saml_connection_id,
            organizationId: organization_id,
            organizationExternalId: organization_external_id,
            state: state
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/v1/saml/redirect"
        end
        SSOReady::GetSAMLRedirectURLResponse.from_json(json_object: response.body)
      end
    end
  end
end
