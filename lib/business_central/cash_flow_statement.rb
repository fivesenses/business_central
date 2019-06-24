##
# Provides access to the /cashFlowStatement API
#

module BusinessCentral
  class CashFlowStatement < BusinessCentral::Base
    API_OBJECT = "cashFlowStatement"
    SUPPORTED_METHODS = [:get]
  end
end
