##
# Provides access to the /purchaseInvoices/{Id}/purchaseInvoiceLines API
#

module BusinessCentral
  class PurchaseInvoiceLine < BusinessCentral::Base
    API_OBJECT = "purchaseInvoiceLines"

    def get(purchase_invoice_id, purchase_invoice_line_id = nil, sequence = nil)
      if purchase_invoice_line_id.nil?
        response = @client.get("/purchaseInvoices/#{purchase_invoice_id}/#{API_OBJECT}")
      else
        response = @client.
          get("/purchaseInvoices/#{purchase_invoice_id}/#{API_OBJECT}?(#{purchase_invoice_line_id}, #{sequence})")
      end
      handle_error(response)
      results = process(response)
      if results.is_a?(Array)
        return results.first if results.length == 1
        return results
      end
    end
  end
end
