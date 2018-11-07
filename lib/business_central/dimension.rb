##
# Provides access to the /dimensions API
#

module BusinessCentral
  class Dimension < BusinessCentral::Base
    API_OBJECT = "dimensions"
    SUPPORTED_METHODS = [:get]
  end
end
