##
# Provides access to the /agedAccountsReceivable API
#

module BusinessCentral
  class AgedAccountsReceivable < BusinessCentral::Base
    API_OBJECT = "agedAccountsReceivable"
    SUPPORTED_METHODS = [:get]
  end
end
