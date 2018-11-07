##
# Provides access to the /customerPaymentsJournals API
#

module BusinessCentral
  class CustomerPaymentsJournal < BusinessCentral::Base
    API_OBJECT = "customerPaymentsJournal"
    SUPPORTED_METHOD = [:get, :create, :update, :delete]
  end
end
