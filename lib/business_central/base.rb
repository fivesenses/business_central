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

    # Build an options Hash to use for building URL's for child objects
    #
    # @params child_id [String]
    # @params sequence [String]
    #
    def build_options(child_id, sequence)
      {
        child_path: api_object,
        child_id: child_id,
        sequence: sequence
      }
    end

    private

    # Check to see if the response contains an error and raise an error if
    # required
    #
    # @param response [Net::HTTPResponse]
    #
    def handle_error(response)
      # raise ServiceUnavailableError unless ["200", "201", "204"].include?(response.code)
    end
  end
end
