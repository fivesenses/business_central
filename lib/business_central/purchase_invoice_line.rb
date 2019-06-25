##
# Provides access to the /purchaseInvoices/{Id}/purchaseInvoiceLines API
#

module BusinessCentral
  class PurchaseInvoiceLine < BusinessCentral::Base
    API_OBJECT_PARENT = "purchaseInvoices"
    API_OBJECT = "purchaseInvoiceLines"

    def get(purchase_invoice_id, purchase_invoice_line_id = nil)
      get_child(purchase_invoice_id, purchase_invoice_line_id)
    end

    def create(purchase_invoice_id, data)
      url = build_url(purchase_invoice_id, nil)

      response = @client.post(url, data)
      handle_error(response)
      results = process(response)

      return results.first
    end

    def update(purchase_invoice_id, purchase_invoice_line_id, etag, data)
      url = build_url(purchase_invoice_id, purchase_invoice_line_id)

      response = @client.patch(url, etag, data)
      handle_error(repsonse)
      results = process(response)

      return results.first
    end

    def delete(purchase_invoice_id, purchase_invoice_line_id, etag)
      url = build_url(purchase_invoice_id, purchase_invoice_line_id)

      response = @client.delete(url, etag)
      handle_error(response)

      return response.code
    end
  end
end
