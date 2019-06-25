##
# Provides the interface to convert the JSON response from the API
# to a Ruby Object
#
module BusinessCentral::Response
  class ResponseHandler
    attr_accessor :dataset
    attr_accessor :compiled_data

    # Constructor
    #
    # @param dataset [Hash | Array] the result from the API operation
    #
    def initialize(dataset)
      @compiled_data = []
      @dataset = dataset
      process
    end

    # Compiles the data in the @dataset to the supplied class
    #
    def process
      @dataset.is_a?(Array) ? process_array : process_data(@dataset)
    end

    # If the supplied result from the API operation is an array, iterate over
    # it and process each result into @compiled_data
    #
    def process_array
      @dataset.each do |data|
        process_data(data)
      end
    end

    # Parse the JSON response from the API into an OpenStruct object. This will
    # also parse any child objects, which allows the data to be accessed via
    # regular chaining
    #
    # eg 
    #   company.address.state
    #
    # @param data [JSON]
    #
    def process_data(data)
      new_record = JSON.parse(sanitize(data), object_class: OpenStruct)

      unless data["@odata.etag"].nil?
        new_record.etag = data["@odata.etag"]
      end
      @compiled_data << new_record
    end

    # Ensures the data is in JSON format
    #
    def sanitize(data)
      data.is_a?(Hash) ? data.to_json : data
    end
  end
end
