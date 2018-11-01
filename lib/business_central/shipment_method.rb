##
# Provides access to the /shipmentMethods API
#

module BusinessCentral
  class ShipmentMethod < BusinessCentral::Base
    API_OBJECT = "shipmentMethods"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
