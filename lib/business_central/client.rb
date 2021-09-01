# frozen_string_literal: true

# An object to handle authentication with BusinessCentral and to
# provide the transport mechanism for interacting with the BusinessCentral API

module BusinessCentral
  class Client
    attr_reader :api_username, :api_password, :api_tenant, :api_company_id,
      :api_host, :api_version, :api_path, :api_token, :client_id, :client_secret

    # Creates an instance of the BusinessCentral::Client.
    #
    # Pass in a Hash of the various options:
    #   api_version: The path of the API Version - eg "/v1.0"
    #   api_path: Appended after the API Version - eg "/api/v1.0"
    #   api_username: Used for Basic Auth
    #   api_password: Used for Basic Auth
    #   api_tenant: The tenant domain for your BusinessCentral installation
    #   api_company_id: The company that will be queried
    #
    # @param opts [Hash] A Hash with login configuration options
    #
    def initialize(opts = {})
      @api_version = opts[:api_version] ||= BusinessCentral::API_VERSION
      @api_path = opts[:api_path] ||= BusinessCentral::API_PATH
      @api_host = opts[:api_host] ||= BusinessCentral::ENDPOINT_PRODUCTION
      @client_id = opts[:client_id] ||= ENV.fetch("BC_CLIENT_ID", nil)
      @client_secret = opts[:client_secret] ||= ENV.fetch("BC_CLIENT_SECRET", nil)
      @api_token = opts[:api_token] ||= ENV.fetch("BC_API_TOKEN", nil)
      @api_tenant = opts[:api_tenant] ||= ENV.fetch("BC_TENANT", "tenant")
      @api_username = opts[:api_username] ||= ENV.fetch("BC_USERNAME", "username")
      @api_password = opts[:api_password] ||= ENV.fetch("BC_PASSWORD", "password")
      @api_company_id = opts[:api_company_id] ||= ENV.fetch("BC_COMPANY_ID", nil)
      @api_environment = opts[:api_environment] ||= ENV.fetch("BC_ENVIRONMENT", "sandbox")
    end

    # Returns the URL used for interacting with the API
    #
    # @returns [String]
    #
    def base_url
      url = if @api_token.present?
        "#{@api_host}#{@api_version}/#{@api_tenant}/#{@api_environment}#{@api_path}"
      else
        "#{@api_host}#{@api_version}/#{@api_tenant}#{@api_path}"
      end

      @api_company_id.nil? ? url : "#{url}/companies(#{@api_company_id})"
    end

    # Performs a GET operation
    #
    # @param url [String] The URL to perform a request on
    # @returns Net::HttpResponse
    #
    def get(url)
      request = build_request({verb: "Get", url: url})
      puts "### Wiise URL: #{request.uri}"
      perform_request(request)
    end

    # Performs a POST operation
    #
    # @param url [String] The URL to perform a request on
    # @param data [Hash] The data to POST to the URL
    # @returns Net::HttpResponse
    #
    def post(url, data)
      request = build_request({verb: "Post", url: url, data: data})
      perform_request(request)
    end

    # Performs a PATCH operation
    #
    # @param url [String] The URL to perform a request on
    # @param etag [String] The etag of the remote object on BusinessCentral
    # @param data [Hash] The data to PATCH the remote object with
    # @returns Net::HttpResponse
    #
    def patch(url, etag, data)
      request = build_request({verb: "Patch", url: url, data: data, etag: etag})
      perform_request(request)
    end

    # Performs a DELETE operation
    #
    # @param url [String] The URL to perform a request on
    # @param etag [String] The etag of the remote object on BusinessCentral
    # @returns Net::HttpResponse
    #
    def delete(url, etag)
      request = build_request({verb: "Delete", url: url, etag: etag})
      perform_request(request)
    end

    def dataset(response)
      json = JSON.parse(response.body)
      if !json["value"].nil?
        json["value"]
      else
        json
      end
      # rescue
      #   {}
    end

    protected

    # @param url [String] the URL to convert
    # @returns URI [URI]
    #
    def get_uri(url)
      URI(base_url + url)
    end

    # Build the actual Request object used to perform the operation
    #
    # @param opts [Hash] contains the request information
    # @returns [Net::HTTP::Request]
    #
    def build_request(opts)
      BusinessCentral::RequestBuilder.new(self, opts).request
    end

    # Performs the actual operation
    #
    # @param request [Net::HTTP::Request]
    # @returns [Net::HTTP::Response]
    #
    def perform_request(request)
      Net::HTTP.start(request.uri.hostname, request.uri.port, use_ssl: true) do |http|
        http.request(request)
      end
    end
  end
end
