##
# Access the /customer API on BusinessCentral
#
module BusinessCentral
  class Customer < BusinessCentral::Base
    OBJECT_URL = "customers"

    def customers
      find_collection(OBJECT_URL)
    end

    def customer(id)
      find_by_id(OBJECT_URL, id).first
    end

    def create_customer(data)
      create(OBJECT_URL, data)
    end

    def update_customer(id, etag, data)
      update(OBJECT_URL, id, etag, data).first
    end
  end
end
