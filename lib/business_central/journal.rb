##
# Provides access to the /journals API
#

module BusinessCentral
  class Journal < BusinessCentral::Base
    API_OBJECT = "journals"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
