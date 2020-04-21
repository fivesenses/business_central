##
# Provides the mechanisms to interact with the BusinessCentral API
#

module BusinessCentral
  class Base
    include BusinessCentral::ApiMethods

    attr_reader :client

    # The +Base+ class used to provide functionality to subclasses
    #
    # @param client [BusinessCentral::Client]
    #
    def initialize(client)
      @client = client.nil? ? BusinessCentral::Client.new() : client
    end

    # Use a BusinessCentral::Response::ResponseHandler to proces the results
    # from the API query
    #
    # @param response [Net::HTTPResponse]
    #
    def process(response)
      BusinessCentral::Response::ResponseHandler.
        new(@client.dataset(response)).
        compiled_data
    rescue JsonError => e
      raise BusinessCentral::JsonError.new(e.message, response)
    end

    # Use the BusinessCentral::URLBuilder to create the URL to query the API
    #
    # @param parent_id [String] the ID of the parent object
    # @param child_id [String] any additional options
    #
    def build_url(parent_id, child_id = nil)
      options = { child_path: api_object }

      if !child_id.nil?
        options[:child_id] = child_id
      end

      BusinessCentral::URLBuilder.new(api_object_parent, parent_id, options).url
    end

    private

    # Check to see if the response contains an error and raise an error if
    # required
    #
    # @param response [Net::HTTPResponse]
    #
    def handle_error(response)
      if response.code == "401"
        raise BusinessCentral::AuthenticationError.new("AuthenticationError", response)
      end

      if response.code == "429"
        raise BusinessCentral::RateLimitError.new("Rate Limited", response)
      end

      if ["400", "500"].include?(response.code)
        raise BusinessCentral::ServiceError.new("Service Error", response)
      end

      unless ["200", "201", "202", "203", "204"].include?(response.code)
        raise BusinessCentral::ServiceUnavailableError.new("Unknown Error", response)
      end
    end
  end
end
