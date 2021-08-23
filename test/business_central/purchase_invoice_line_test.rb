require "test_helper"

class BusinessCentral::PurchaseInvoiceLineTest < Test::Unit::TestCase
  def test_initialize
    purchase_invoice_line =
      BusinessCentral::PurchaseInvoiceLine.new(bc_client)

    assert_not_nil purchase_invoice_line
  end

  def test_get_collection
    stub_get("/purchaseInvoices(1234)/purchaseInvoiceLines")
      .with(headers: stub_headers)
      .to_return(
        status: 200,
        body: fixture("get_purchaseInvoiceLines_200.json")
      )

    invoice_lines =
      BusinessCentral::PurchaseInvoiceLine.new(bc_client).get("1234")

    assert invoice_lines.length > 0
  end

  def test_get_invoice
    stub_get("/purchaseInvoices(1234)/purchaseInvoiceLines(4321-10000)")
      .with(headers: stub_headers)
      .to_return(
        status: 200,
        body: fixture("get_purchaseInvoiceLine_200.json")
      )

    invoice_line = BusinessCentral::PurchaseInvoiceLine
      .new(bc_client)
      .get("1234", "4321-10000")

    assert_equal "LONDON Swivel Chair, blue", invoice_line.description
  end
end
