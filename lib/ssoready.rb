# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "ssoready/saml/client"
require_relative "ssoready/scim/client"
require_relative "ssoready/management/client"

module SSOReady
  class Client
    # @return [SSOReady::SAMLClient]
    attr_reader :saml
    # @return [SSOReady::SCIMClient]
    attr_reader :scim
    # @return [SSOReady::Management::Client]
    attr_reader :management

    # @param base_url [String]
    # @param environment [SSOReady::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [SSOReady::Client]
    def initialize(base_url: nil, environment: SSOReady::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil, api_key: ENV["SSOREADY_API_KEY"])
      @request_client = SSOReady::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
      @saml = SSOReady::SAMLClient.new(request_client: @request_client)
      @scim = SSOReady::SCIMClient.new(request_client: @request_client)
      @management = SSOReady::Management::Client.new(request_client: @request_client)
    end
  end

  class AsyncClient
    # @return [SSOReady::AsyncSAMLClient]
    attr_reader :saml
    # @return [SSOReady::AsyncSCIMClient]
    attr_reader :scim
    # @return [SSOReady::Management::AsyncClient]
    attr_reader :management

    # @param base_url [String]
    # @param environment [SSOReady::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [SSOReady::AsyncClient]
    def initialize(base_url: nil, environment: SSOReady::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil, api_key: ENV["SSOREADY_API_KEY"])
      @async_request_client = SSOReady::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        api_key: api_key
      )
      @saml = SSOReady::AsyncSAMLClient.new(request_client: @async_request_client)
      @scim = SSOReady::AsyncSCIMClient.new(request_client: @async_request_client)
      @management = SSOReady::Management::AsyncClient.new(request_client: @async_request_client)
    end
  end
end
