require 'test_helper'

class BusinessCentral::SalesInvoiceLineTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::SalesInvoiceLine.new(bc_client)
    assert_not_nil api
  end

  test "should return a sales invoice line" do
    stub_get("salesInvoices(1234)/salesInvoiceLines(4321-10000)").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_salesInvoiceLine_200.json"))

    invoiceLine = BusinessCentral::SalesInvoiceLine.new(bc_client).get("1234", "4321-10000")
    assert_equal "ROME Guest Chair, green", invoiceLine.description
  end

  test "should return all invoice lines for a given salesInvoice" do
    stub_get("salesInvoices(1234)/salesInvoiceLines").
      with(headers: stub_headers).
      to_return(status:200, body: fixture("get_salesInvoiceLines_200.json"))

    invoiceLines = BusinessCentral::SalesInvoiceLine.new(bc_client).get("1234")
    assert invoiceLines.is_a?(Array)

    assert_equal "LONDON Swivel Chair, blue", invoiceLines.first.description
  end

  test "should return salesInvoiceLines when only one line exists" do
    stub_get("salesInvoices(1234)/salesInvoiceLines").
      with(headers: stub_headers).
      to_return(status:200, body: fixture("get_salesInvoiceLines_single_200.json"))

    invoiceLines = BusinessCentral::SalesInvoiceLine.new(bc_client).get("1234")
    assert invoiceLines.is_a?(Array)

    assert_equal "ROME Guest Chair, green", invoiceLines.first.description
  end

  test "should be able to create a new invoiceLine" do
    stub_post("salesInvoices(1234)/salesInvoiceLines").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("post_salesInvoiceLine_200.json"))

    invoiceLine = BusinessCentral::SalesInvoiceLine.new(bc_client).create(1234, new_invoice_line)

    assert_equal "Conference Bundle 1-6", invoiceLine.description
    assert_equal "1925-W", invoiceLine.lineDetails["number"]
  end

  def new_invoice_line
    {
      "itemId": "1234",
      "lineType": "Item",
      "quantity": 10
    }
  end
end
