require 'test_helper'

class BusinessCentral::SalesInvoiceTest < Test::Unit::TestCase
  test "should initialize the object" do
    sales_invoice = BusinessCentral::SalesInvoice.new(bc_client)
    assert_not_nil sales_invoice
  end

  test "should return a salesInvoice" do
    stub_get("salesInvoices(1234)").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_salesInvoice_200.json"))

    invoice = BusinessCentral::SalesInvoice.new(bc_client).get("1234")
    assert_equal "Alpine Ski House", invoice.customerName
  end

  test "should create a salesInvoice" do
    stub_post("salesInvoices").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("post_salesInvoice_200.json"))

    invoice = BusinessCentral::SalesInvoice.new(bc_client).create(new_invoice)
    assert_equal "377804ae-d0fc-4db8-95dc-f88b8698590c", invoice.id
    assert_equal "1001", invoice.number
    assert_equal "Company Name", invoice.customerName
    assert_equal "1fcb773e-f9f9-4e3b-b827-28e25ecb8dbc", invoice.paymentTermsId

  end

  def new_invoice
    {
      "number": "1001",
      "invoiceDate": "2019-04-04",
      "customerNumber": "3459",
      "currencyCode": "AUD",
      "paymentTermsId": "1fcb773e-f9f9-4e3b-b827-28e25ecb8dbc"
    }
  end
end
