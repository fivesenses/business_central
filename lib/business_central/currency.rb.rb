##
# Provides access to the /currencies API
#
module BusinessCentral
  class Currency < BusinessCentral::Base
    API_OBJECT = "currencies"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
