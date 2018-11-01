##
# Provides access to the /purchaseInvoices/{Id}/purchaseInvoiceLines API
#

module BusinessCentral
  class PurchaseInvoiceLine < BusinessCentral::Base
    API_OBJECT = "purchaseInvoiceLines"
  end

  def get(purchase_invoice_id, purchase_invoice_line_id = nil, sequence = nil)
    if purchase_invoice_line_id.nil?
      response = @client.get("/purchaseInvoices/#{purchase_invoice_id}/#{API_OBJECT}")
    else
      response = @client.
        get("/purchaseInvoices/#{purchase_invoice_id}/#{API_OBJECT}(#{purchase_invoice_line_id}, #{sequence})")
    end
    handle_error(response)
    process(response)
  end
end
