##
# Access the /salesOrders API on Business Central
#
module BusinessCentral
  class SalesOrder < BusinessCentral::Base
    API_OBJECT = "salesOrders"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
