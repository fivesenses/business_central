##
# Provides access to the /unitsOfMeasure API
#

module BusinessCentral
  class UnitOfMeasure < BusinessCentral::Base
    API_OBJECT = "unitsOfMeasure"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
