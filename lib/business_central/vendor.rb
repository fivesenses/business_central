##
# Provides access to the /vendors API
#

module BusinessCentral
  class Vendor < BusinessCentral::Base
    API_OBJECT = "vendor"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
