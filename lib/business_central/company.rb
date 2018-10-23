##
# Access the /company API on BusinessCentral
#
module BusinessCentral
  class Company < BusinessCentral::Base

    def company(id)
      find_by_id("companies", id).first
    end

    # Find a list of companies
    def companies
      find_collection("companies")
    end

    def process(response)
      BusinessCentral::Response::ResponseHandler.
        new(dataset(response)).compiled_data
    end
  end
end
