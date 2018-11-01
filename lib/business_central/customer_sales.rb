##
# Provides access to the /customerSales API
#

module BusinessCentral
  class CustomerSales < BusinessCentral::Base
    API_OBJECT = "customerSales"
    SUPPORTED_METHODS = [:get]
  end
end
