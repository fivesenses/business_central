##
# Provides access to the /salesInvoices/{Id}/salesInvoiceLines API
#

module BusinessCentral
  class SalesInvoiceLine < BusinessCentral::Base
    API_OBJECT_PARENT = "salesInvoices"
    API_OBJECT = "salesInvoiceLines"

    SUPPORTED_METHODS = [:get, :create, :update, :delete]

    def get(sales_invoice_id, sales_invoice_line_id = nil)
      get_child(sales_invoice_id, sales_invoice_line_id)
    end

    def create(sales_invoice_id, data)
      url = "/#{API_OBJECT_PARENT}(#{sales_invoice_id})/#{API_OBJECT}"

      response = @client.post(url, data)
      handle_error(response)
      result = process(response)
      return result.first
    end
  end
end
