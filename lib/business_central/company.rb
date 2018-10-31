##
# Access the /company API on BusinessCentral
#
module BusinessCentral
  class Company < BusinessCentral::Base
    API_OBJECT = "companies"
    SUPPORTED_METHODS = [:get]
  end
end
