##
# Provides the mechanisms to interact with the BusinessCentral API
#

module BusinessCentral
  class Base
    attr_reader :client

    # The +Base+ class used to provide functionality to subclasses
    #
    # Params:
    # +client+:: A +BusinessCentral::Client+ instance
    def initialize(client)
      @client = client.nil? ? BusinessCentral::Client.new() : client
    end

    def find_collection(object_url)
      response = get("/#{object_url}")
      handle_error(response)
      process(response)
    end

    def find_by_id(object_url, id)
      response = get("/#{object_url}/#{id}")
      handle_error(response)
      process(response)
    end

    def create(object_url, data)
      response = post("/#{object_url}", data)
      handle_error(response)
      process(response)
    end

    def update(object_url, id, data)
      response = patch("/#{object_url}/#{id}", data)
      handle_error(response)
      process(response)
    end

    def process(response); end

    protected
    # Builds the filter URL from the provided options
    #
    # Params:
    # +filter+:: +String+ The object name to filter
    # +opts+::  +Hash+ Options to filter the request being performed
    def url_filter(filter, opts = {})
      "#{uri_options(filter, opts)}"
    end

    private
    def get(url)
      @client.get(url)
    end

    def post(url, data)
      @client.post(url, data)
    end

    def patch(url, data)
      @client.patch(url, data)
    end

    def base_url
      @client.base_url
    end

    def handle_error(response)
      raise ServiceUnavailableError unless response.code == 200
    end

    def uri_options(filter, opts)
      @client.uri_options(filter, opts)
    end

    def dataset(response)
      @client.dataset(response)
    end
  end
end
