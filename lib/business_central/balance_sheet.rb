##
# Provides access to the /balanceSheet API
#

module BusinessCentral
  class BalanceSheet < BusinessCentral::Base
    API_OBJECT = "balanceSheet"
    SUPPORTED_METHODS = [:get]
  end
end
