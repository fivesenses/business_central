##
# Provides access to the /salesCreditMemos API
#

module BusinessCentral
  class SalesCreditMemo < BusinessCentral::Base
    API_OBJECT = "salesCreditMemos"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
