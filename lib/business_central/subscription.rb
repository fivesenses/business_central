##
# Access the /subscriptions API on BusinessCentral
#
# Allows the registration of Webhooks to receive notifications of updates to
# various resources
#
# The system uses a slightly different URL for the registration process. It
# doesn't include the TenantID (eg /companies(XXXX)) in the POST url

module BusinessCentral
  class Subscription < BusinessCentral::Base
    API_OBJECT = "subscriptions"
    SUPPORTED_METHODS = [:post]

    attr_reader :resource, :endpoint, :client

    def initialize(client, resource, endpoint)
      @client = client.nil? ? BusinessCentral::Client.new() : client
      @resource = resource
      @endpoint = endpoint
    end

    def get
      request = Net::HTTP::Get.new(URI(request_url))
      request.content_type = "application/json"
      request.basic_auth(@client.api_username, @client.api_password)
      response = perform_request(request)
      JSON.parse(response.body)
    end

    def create
      request = Net::HTTP::Post.new(URI(request_url))
      request.content_type = "application/json"
      request.basic_auth(@client.api_username, @client.api_password)
      request.body = JSON.generate(post_data)
      request

      response = perform_request(request)

      JSON.parse(response.body)
    end

    def perform_request(request)
      Net::HTTP.start(request.uri.hostname, request.uri.port, use_ssl: true) do |http|
        http.request(request)
      end
    end

    def request_url
      "#{@client.api_host}#{@client.api_version}#{@client.api_path}/subscriptions"
    end

    def post_data
      {
        "notificationUrl": @endpoint,
        "resource": @resource
      }
    end

    def build_request_object
    end
  end
end
