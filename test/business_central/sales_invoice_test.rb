require "test_helper"

class BusinessCentral::SalesInvoiceTest < Test::Unit::TestCase
  test "should initialize the object" do
    sales_invoice = BusinessCentral::SalesInvoice.new(bc_client)
    assert_not_nil sales_invoice
  end

  test "should return a salesInvoice" do
    stub_get("/salesInvoices(1234)")
      .with(headers: stub_headers)
      .to_return(
        status: 200,
        body: fixture("get_salesInvoice_200.json")
      )

    invoice = BusinessCentral::SalesInvoice.new(bc_client).get("1234")
    assert_equal "Alpine Ski House", invoice.customerName
  end

  test "should create a salesInvoice" do
    stub_post("/salesInvoices")
      .with(headers: stub_headers)
      .to_return(
        status: 200,
        body: fixture("post_salesInvoice_200.json")
      )

    invoice = BusinessCentral::SalesInvoice.new(bc_client).create(new_invoice)

    assert_equal "aa4426d0-a7d3-4272-be0d-bfe1fa642094", invoice.id
    assert_equal "103404", invoice.number
    assert_equal "Updated Customer Name", invoice.customerName
    assert_equal "9e846824-c73a-4649-b827-138b941781c2", invoice.paymentTermsId
  end

  def new_invoice
    {
      "number": "103404",
      "invoiceDate": "2019-07-01",
      "customerNumber": "3459",
      "currencyCode": "AUD",
      "paymentTermsId": "1fcb773e-f9f9-4e3b-b827-28e25ecb8dbc"
    }
  end
end
