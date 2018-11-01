##
# Provides access to the /paymentMethods API
#

module BusinessCentral
  class PaymentMethod < BusinessCentral::Base
    API_OBJECT = "paymentMethods"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
