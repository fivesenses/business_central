##
# Provides access to the /items API
#

module BusinessCentral
  class Item < BusinessCentral::Base
    API_OBJECT = "items"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
