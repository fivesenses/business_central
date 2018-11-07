##
# Provides access to the /agedAccountsPayable API
#

module BusinessCentral
  class AgedAccountsPayable < BusinessCentral::Base
    API_OBJECT = "agedAccountsPayable"
    SUPPORTED_METHODS = [:get]
  end
end
