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

    def build_url(parent_id, options = {})
      BusinessCentral::URLBuilder.new(api_object_parent, parent_id, options).url
    end

    def build_options(child_id, sequence)
      {
        child_path: api_object,
        child_id: child_id,
        sequence: sequence
      }
    end

    private
    def base_url
      @client.base_url
    end

    def handle_error(response)
      # raise ServiceUnavailableError unless ["200", "201", "204"].include?(response.code)
    end

    def uri_options(filter, opts)
      @client.uri_options(filter, opts)
    end

    def dataset(response)
      @client.dataset(response)
    end
  end
end
