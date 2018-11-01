##
# Provides access to the /salesInvoices API
#

module BusinessCentral
  class SalesInvoice < BusinessCentral::Base
    API_OBJECT = "salesInvoices"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
