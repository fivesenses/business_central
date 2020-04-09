require 'test_helper'

class BusinessCentral::CustomerTest < Test::Unit::TestCase
  def test_initialize
    api_customer = BusinessCentral::Customer.new(bc_client)
    assert_not_nil api_customer
  end

  def test_customers_success
    stub_get("customers").with(headers: stub_headers).
      to_return(
        status: 200,
        body: fixture("get_customers_200.json")
    )

    customers = BusinessCentral::Customer.new(bc_client).get
    assert customers.length > 0
  end

  def test_customer_success
    stub_get("customers(1234)").with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_customer_200.json"))

    customer = BusinessCentral::Customer.new(bc_client).get("1234")
    assert_equal "School of Fine Art", customer.displayName
  end

  test "should return the extra details for a customer" do
    stub_get("customers(1234)?$expand=customerFinancialDetails").
      with(headers: stub_headers).
      to_return(
        status: 200,
        body: fixture("get_customer_expanded_200.json"))

    customer = BusinessCentral::Customer.new(bc_client).get("1234", "$expand=customerFinancialDetails")
    assert_equal "School of Fine Art", customer.displayName
    assert_equal 95193, customer.customerFinancialDetails.first.balance
  end

  def test_customer_filter
    stub_get("customers?$filter=number eq '1234'").
      with(headers: stub_headers).
      to_return(
        status: 200,
        body: fixture("filter_customers_200.json"))

    search = BusinessCentral::Customer.new(bc_client).query("number eq '1234'")
    assert_equal "School of Fine Art", search.first.displayName
  end

  def test_customer_update
    data = { displayName: "Bill Example" }
    etag = "W/\"JzQ0O1JpdzI0TmU4NEpRS0R6cHAzTkVBdHpxYXorc0VLbnJ4OVQyTFJjclREeG89MTswMDsn\""

    stub_patch("customers(1234)").with(
      headers: stub_headers.merge({'If-Match'=>etag}),
      body: data
    ).to_return(
        status: 200,
        body: fixture("patch_customer_200.json"))

    customer = BusinessCentral::Customer.new(bc_client).
      update("1234", etag, data)

    assert_equal "Updated Customer Name", customer.displayName
  end

  def test_customer_create
    stub_post("customers").
      with(headers: stub_headers,
           body: new_customer).
      to_return(
        status: 201,
        body: fixture("post_customer_200.json"))

    customer = BusinessCentral::Customer.new(bc_client).
      create(new_customer)

    assert_equal "Coho Winery", customer.displayName
    assert_equal "Person", customer.type
    assert_equal "CAD", customer.currencyCode
  end

  test "should return an error when a customer already exists" do
    stub_post("customers").
      with(headers: stub_headers, body: new_customer).
      to_return(
        status: 400,
        body: fixture("post_customer_409.json"))

    assert_raise("ServiceError") do
      customer = BusinessCentral::Customer.
        new(bc_client).
        create(new_customer)

      assert_not_nil customer.error
      assert_equal "Internal_EntityWithSameKeyExists", customer.error.code
      assert_match(/Customer already exists/, customer.error.message)
    end
  end

  def new_customer
    {
      "number": "10000",
      "displayName": "Coho Winery",
      "type": "Company",
      "address": "{
        :street => \"192 Market Square\",
        :city => \"Atlanta\",
        :state => \"GA\",
        :countryLetterCode => \"US\",
        :postalCode => \"31772\"
      }",
      "phoneNumber": "",
      "email": "jim.glynn@cronuscorp.net",
      "website": "",
      "taxLiable": true,
      "taxAreaId": "taxAreaId-value",
      "taxAreaDisplayName": "tax area",
      "taxRegistrationNumber": "28012001T",
      "currencyId": "currencyId-value",
      "currencyCode": "USD",
      "paymentTermsId": "paymentTermsId-value",
      "paymentTerms": "{
        :code => \"1M(8D)\",
        :description => \"1 Month/2% 8 Days\"
      }",
      "shipmentMethodId": "shipmentMethodId-value",
      "shipmentMethod": nil,
      "paymentMethodId": "paymentMethodId-value",
      "paymentMethod": "{
        :code => \"BANK\",
        :description => \"Bank Transfer\"
      }",
      "blocked": " ",
      "overdueAmount": 0,
      "totalSalesExcludingTax": 0,
    }
  end
end
