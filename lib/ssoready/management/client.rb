# frozen_string_literal: true

require_relative "../../requests"
require_relative "organizations/client"
require_relative "saml_connections/client"
require_relative "scim_directories/client"
require_relative "setup_urls/client"

module SSOReady
  module Management
    class Client
      # @return [SSOReady::Management::OrganizationsClient]
      attr_reader :organizations
      # @return [SSOReady::Management::SAMLConnectionsClient]
      attr_reader :saml_connections
      # @return [SSOReady::Management::SCIMDirectoriesClient]
      attr_reader :scim_directories
      # @return [SSOReady::Management::SetupURLsClient]
      attr_reader :setup_urls

      # @param request_client [SSOReady::RequestClient]
      # @return [SSOReady::Management::Client]
      def initialize(request_client:)
        @organizations = SSOReady::Management::OrganizationsClient.new(request_client: request_client)
        @saml_connections = SSOReady::Management::SAMLConnectionsClient.new(request_client: request_client)
        @scim_directories = SSOReady::Management::SCIMDirectoriesClient.new(request_client: request_client)
        @setup_urls = SSOReady::Management::SetupURLsClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [SSOReady::Management::AsyncOrganizationsClient]
      attr_reader :organizations
      # @return [SSOReady::Management::AsyncSAMLConnectionsClient]
      attr_reader :saml_connections
      # @return [SSOReady::Management::AsyncSCIMDirectoriesClient]
      attr_reader :scim_directories
      # @return [SSOReady::Management::AsyncSetupURLsClient]
      attr_reader :setup_urls

      # @param request_client [SSOReady::AsyncRequestClient]
      # @return [SSOReady::Management::AsyncClient]
      def initialize(request_client:)
        @organizations = SSOReady::Management::AsyncOrganizationsClient.new(request_client: request_client)
        @saml_connections = SSOReady::Management::AsyncSAMLConnectionsClient.new(request_client: request_client)
        @scim_directories = SSOReady::Management::AsyncSCIMDirectoriesClient.new(request_client: request_client)
        @setup_urls = SSOReady::Management::AsyncSetupURLsClient.new(request_client: request_client)
      end
    end
  end
end
