##
# Provides access to the /taxGroups API
#

module BusinessCentral
  class TaxGroup < BusinessCentral::Base
    API_OBJECT = "taxGroups"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
