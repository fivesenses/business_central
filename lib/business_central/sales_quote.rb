##
# Provides access to the /salesQuotes API
#

module BusinessCentral
  class SalesQuote < BusinessCentral::Base
    API_OBJECT = "salesQuotes"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
