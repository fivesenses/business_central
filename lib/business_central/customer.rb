##
# Access the /customer API on BusinessCentral
#
module BusinessCentral
  class Customer < BusinessCentral::Base
    API_OBJECT = "customers"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]

    def create_customer(data)
      create(data)
    end

    def update_customer(id, etag, data)
      update(id, etag, data).first
    end
  end
end
