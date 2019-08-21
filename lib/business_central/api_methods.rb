##
# Provides an interface between the object methods and the API
#
module BusinessCentral
  module ApiMethods

    # The method_missing method is used to determine if a called method exists
    # in the defined constant for each local object - SUPPORTED_METHODS. This
    # ensures that only supported operations can be called.
    #
    # @param method_name [String]
    # @param args [Array]]
    # @param block [Block]
    #
    def method_missing(method_name, *args, &block)
      if supported_method?(method_name.to_sym)
        self.send(method_name.to_sym, args)
      else
        "#{method_name} is not supported"
      end
    end

    # Determines if the GET operation is for all remote objects, a single
    # object, or a single object with optional parameters being supplied
    #
    # When no parameters are supplied, the GET will be for all remote objects
    # eg
    #   .get()
    #
    # When one parameter is supplied, the GET will be for the single object
    # eg
    #   .get("1234")
    #
    # When more than one parameter is supplied, the GET will be for the single
    # object, and then for the supplied optional parameters
    #
    # An example of the options is 
    #   .get("1234", "$extended=customerFinancialDetails")
    #
    # @param args [Array]]
    #
    def get(*args)
      case args.length
      when 0
        find_collection
      when 1
        find_by_id(args[0]).first
      else
        find_by_id_with_options(*args).first
      end
    end

    # Gets a child object, or array of child objects
    #
    # When only the parent_id is supplied, the GET will return all child
    # objects of that parent
    # eg
    #   get_child(1234)
    #
    # when both paremeters are present, the GET will return the single child
    # object
    # eg
    #   get_child(1234, 4321)
    #
    # @param parent_id [String]
    # @param child_id [String]
    #
    def get_child(parent_id, child_id = nil)
      url = build_url(parent_id, child_id)

      response = @client.get(url)
      handle_error(response)
      results = process(response)

      if results.is_a?(Array)
        return results if child_id.nil? || results.length > 1
        return results.first
      end
    end

    # Performs a GET operation with a supplied filter string, to search for
    # remote objects.
    #
    # eg
    #   .get("'lastModifiedDate lt '2019-01-01T01:01:01+08:00'")
    #
    # @param args [Array]]
    #
    def query(*args)
      response = @client.get("/#{api_object}?$filter=#{args[0]}")
      handle_error(response)
      process(response)
    end

    def query_child(parent_id, query)
      response = @client.get("/#{api_object_parent}(#{parent_id})/#{api_object}?$filter=#{query}")
      handle_error(response)
      process(response)
    end

    # Performs the POST operation on the supplied args
    #
    # @param args [Array]]
    #
    def create(*args)
      return if args.length == 0
      post(args[0]).first
    end

    # Performs the PATCH operation on the supplied args
    #
    # Expects arguments (id, etag, data)
    #
    # @param args [Array]]
    #
    def update(*args)
      return if args.length == 0
      patch(args[0], args[1], args[2]).first
    end

    # Performs the DELETE operation on the supplied args
    #
    # Expects arguments (id, etag)
    #
    # @param args [Array]
    #
    def delete(*args)
      return if args.length == 0
      destroy(args[0], args[1])
    end

    private

    # Finds and returns an array of remote objects
    #
    def find_collection
      response = @client.get("/#{api_object}")
      handle_error(response)
      process(response)
    end

    # Finds and returns the single object
    #
    # @param id [String]
    #
    def find_by_id(id)
      response = @client.get("/#{api_object}(#{id})")
      handle_error(response)
      process(response)
    end

    # Finds and returns the single object, with additional options
    #
    # @param args [Array]
    #
    def find_by_id_with_options(*args)
      id = args[0]
      options = args[1]

      response = @client.get("/#{api_object}(#{id})?#{options}")
      handle_error(response)
      process(response)
    end

    # POSTs supplied data to the API
    #
    # @param data [Hash]
    #
    def post(data)
      response = @client.post("/#{api_object}", data)
      handle_error(response)
      process(response)
    end

    # Performs the PATCH operation
    #
    # @param id [String]
    # @param etag [String]
    # @param data [Hash]
    #
    def patch(id, etag, data)
      response = @client.patch("/#{api_object}(#{id})", etag, data)
      handle_error(response)
      process(response)
    end

    # Performs the actual DELETE operation
    #
    # @param id [String] the remote object ID
    # @param etag [String] the remote object etag
    #
    # @returns [Net::HTTPResponse.code]
    #
    def destroy(id, etag)
      response = @client.delete("/#{api_object}(#{id})", etag)
      handle_error(response)
      response.code
    end

    # Each class definition that corresponds to an API endpoint will have
    # a constant defined that identifies the object to call on the API.
    #
    def api_object
      self.class.const_get(:API_OBJECT)
    end

    # Some API endpoints are for child objects. In those class definitions
    # a constant is defined to identify the parent object
    #
    def api_object_parent
      self.class.const_get(:API_OBJECT_PARENT)
    end

    # Not all operations are supported on all API endpoints, so each class
    # definition has an array of supported methods defined in a constant. This
    # function determines if the method supplied is supported, after being
    # called by :method_missing
    #
    # @param method [String]
    # @returns [Boolean]
    #
    def supported_method?(method_name)
      self.class.const_get(:SUPPORTED_METHODS).include?(method_name)
    end
  end
end
