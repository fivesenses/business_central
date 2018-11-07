##
# Provides access to the /customerPaymentsJournal/{Id}/customerPayments API
#

module BusinessCentral
  class CustomerPayment < BusinessCentral::Base
    API_OBJECT_PARENT = "customerPaymentsJournal"
    API_OBJECT = "customerPayments"

    def get(customer_payments_journal_id, customer_payment_id = nil)
      url = build_url(customer_payments_journal_id,
                      build_options(customer_payment_id, nil))
    end
  end
end
