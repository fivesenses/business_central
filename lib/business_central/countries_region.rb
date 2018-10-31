##
# Provides access to the /countriesRegions API
#
module BusinessCentral
  class CountriesRegion < BusinessCentral::Base
    API_OBJECT = "countriesRegions"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
