##
# Provides access to the /paymentTerms API
#

module BusinessCentral
  class PaymentTerm < BusinessCentral::Base
    API_OBJECT = "paymentTerms"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
