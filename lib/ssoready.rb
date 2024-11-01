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

    # @param environment [SSOReady::Environment]
    # @param base_url [String]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [SSOReady::Client]
    def initialize(environment: SSOReady::Environment::DEFAULT, base_url: nil, max_retries: nil,
                   timeout_in_seconds: nil, api_key: nil)
      @request_client = SSOReady::RequestClient.new(
        environment: environment,
        base_url: base_url,
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

    # @param environment [SSOReady::Environment]
    # @param base_url [String]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [SSOReady::AsyncClient]
    def initialize(environment: SSOReady::Environment::DEFAULT, base_url: nil, max_retries: nil,
                   timeout_in_seconds: nil, api_key: nil)
      @async_request_client = SSOReady::AsyncRequestClient.new(
        environment: environment,
        base_url: base_url,
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
