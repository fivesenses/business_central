##
# Provides access to the /purchaseInvoices/{Id}/purchaseInvoiceLines API
#

module BusinessCentral
  class PurchaseInvoiceLine < BusinessCentral::Base
    API_OBJECT_PARENT = "purchaseInvoices"
    API_OBJECT = "purchaseInvoiceLines"

    def get(purchase_invoice_id, purchase_invoice_line_id = nil, sequence = nil)
      url = build_url(purchase_invoice_id,
                      build_options(purchase_invoice_line_id, sequence))

      response = @client.get(url)
      handle_error(response)
      results = process(response)

      if results.is_a?(Array)
        return results.first if results.length == 1
        return results
      end
    end

    def create(purchase_invoice_id, data)
      url = build_url(purchase_invoice_id, build_options)

      response = @client.post(url, data)
      handle_error(response)
      results = process(response)

      return results.first
    end

    def update(purchase_invoice_id, purchase_invoice_line_id, etag, data)
      url = build_url(purchase_invoice_id, build_options(purchase_invoice_line_id))

      response = @client.patch(url, etag, data)
      handle_error(repsonse)
      results = process(response)

      return results.first
    end

    def delete(purchase_invoice_id, purchase_invoice_line_id, etag)
      url = build_url(purchase_invoice_id, build_options(purchase_invoice_line_id))

      response = @client.delete(url, etag)
      handle_error(response)

      return response.code
    end
  end
end
