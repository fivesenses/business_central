##
# PRovides access to the /taxAreas API
#

module BusinessCentral
  class TaxArea < BusinessCentral::Base
    API_OBJECT = "taxAreas"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
