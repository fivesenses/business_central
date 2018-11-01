require 'test_helper'

class BusinessCentral::PurchaseInvoiceLineTest < Test::Unit::TestCase
  def test_initialize
    purchaseInvoiceLine = BusinessCentral::PurchaseInvoiceLine.new(bc_client)
    assert_not_nil purchaseInvoiceLine
  end

  def test_get_collection
    stub_get("purchaseInvoices/1234/purchaseInvoiceLines").
      with(headers: stub_headers).
      to_return(status: 200,
                body: fixture("get_purchase_invoice_lines_success.json"))

    invoiceLines = BusinessCentral::PurchaseInvoiceLine.new(bc_client).
      get("1234")

    assert invoiceLines.length > 0
  end

  def test_get_invoice
    stub_get("purchaseInvoices/1234/purchaseInvoiceLines?(4321, 10000)").
      with(headers: stub_headers).
      to_return(status: 200,
                body: fixture("get_purchase_invoice_line_success.json"))

    invoiceLine = BusinessCentral::PurchaseInvoiceLine.new(bc_client).
      get("1234", "4321", "10000")
    assert_equal "LONDON Swivel Chair, blue", invoiceLine.description
  end
end
