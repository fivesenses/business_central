##
# Provides access to the /vendorPurchases API
#

module BusinessCentral
  class VendorPurchase < BusinessCentral::Base
    API_OBJECT = "vendorPurchase"
    SUPPORTED_METHODS = [:get]
  end
end
