##
# Provides access to the /purchaseInvoices API
#

module BusinessCentral
  class PurchaseInvoice < BusinessCentral::Base
    API_OBJECT = "purchaseInvoices"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
