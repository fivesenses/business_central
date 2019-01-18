##
# Provides an interface between the object methods and the API
#
module BusinessCentral
  module ApiMethods
    def method_missing(method_name, *args, &block)
      if supported_method?(method_name.to_sym)
        self.send(method_name.to_sym, args)
      else
        "#{method_name} is not supported"
      end
    end

    def get(*args)
      if args.length == 0
        find_collection
      else
        find_by_id(args[0]).first
      end
    end

    def create(*args)
      return if args.length == 0
      post(args[0]).first
    end

    def update(*args)
      return if args.length == 0
      patch(args[0], args[1], args[2]).first
    end

    def delete(*args)
      return if args.length == 0
      destroy(args[0], args[1])
    end

    private
    def find_collection
      response = @client.get("/#{api_object}")
      handle_error(response)
      process(response)
    end

    def find_by_id(id)
      response = @client.get("/#{api_object}/#{id}")
      handle_error(response)
      process(response)
    end

    def post(data)
      response = @client.post("/#{api_object}", data)
      handle_error(response)
      process(response)
    end

    def patch(id, etag, data)
      response = @client.patch("/#{api_object}/#{id}", etag, data)
      handle_error(response)
      process(response)
    end

    def destroy(id, etag)
      response = @client.delete("/#{api_object}/#{id}", etag)
      handle_error(response)
      response.code
    end

    def api_object
      self.class.const_get(:API_OBJECT)
    end

    def api_object_parent
      self.class.const_get(:API_OBJECT_PARENT)
    end

    def supported_method?(method_name)
      self.class.const_get(:SUPPORTED_METHODS).include?(method_name)
    end
  end
end
