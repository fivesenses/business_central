##
# Access the /customer API on BusinessCentral
#
module BusinessCentral
  class Customer < BusinessCentral::Base
    API_OBJECT = "customers"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
