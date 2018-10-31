##
# Provides the mechanisms to interact with the BusinessCentral API
#

module BusinessCentral
  class Base
    include BusinessCentral::ApiMethods

    attr_reader :client

    # The +Base+ class used to provide functionality to subclasses
    #
    # Params:
    # +client+:: A +BusinessCentral::Client+ instance
    def initialize(client)
      @client = client.nil? ? BusinessCentral::Client.new() : client
    end

    def process(response)
      BusinessCentral::Response::ResponseHandler.
        new(dataset(response)).compiled_data
    end

    private
    def base_url
      @client.base_url
    end

    def handle_error(response)
      # raise ServiceUnavailableError unless response.code == 200
    end

    def uri_options(filter, opts)
      @client.uri_options(filter, opts)
    end

    def dataset(response)
      @client.dataset(response)
    end
  end
end
