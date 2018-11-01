##
# Provides access to the /itemCategories API
#

module BusinessCentral
  class ItemCategory < BusinessCentral::Base
    API_OBJECT = "itemCategories"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
