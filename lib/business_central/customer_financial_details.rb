##
# Access the /customerFinancialDetails API on BusinessCentral
#

module BusinessCentral
  class CustomerFinancialDetails < BusinessCentral::Base
    API_OBJECT = "customerFinancialDetails"
    SUPPORTED_METHODS = [:get]
  end
end
