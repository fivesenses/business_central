##
# Access the /company API on BusinessCentral
#
module BusinessCentral
  class Company < BusinessCentral::Base
    OBJECT_URL = "companies"

    def company(id)
      find_by_id(OBJECT_URL, id).first
    end

    # Find a list of companies
    def companies
      find_collection(OBJECT_URL)
    end

    def create_company(data)
      create(OBJECT_URL, data)
    end

    def update_company(id, etag, data)
      update(OBJECT_URL, id, etag, data).first
    end
  end
end
