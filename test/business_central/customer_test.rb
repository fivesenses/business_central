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
        body: fixture("get_customers_success.json")
    )

    customers = BusinessCentral::Customer.new(bc_client).get
    assert customers.length > 0
  end

  def test_customer_success
    stub_get("customers/1234").with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_customer_success.json"))

    customer = BusinessCentral::Customer.new(bc_client).get("1234")
    assert_equal "Chicken Feet", customer.displayName
  end

  def test_customer_update
    data = { displayName: "Bill Example" }
    etag = "W/\"JzQ0O1JpdzI0TmU4NEpRS0R6cHAzTkVBdHpxYXorc0VLbnJ4OVQyTFJjclREeG89MTswMDsn\""

    stub_patch("customers/1234").with(
      headers: stub_headers.merge({'If-Match'=>etag}),
      body: data
    ).to_return(
        status: 200,
        body: fixture("patch_customer_success.json"))

    customer = BusinessCentral::Customer.new(bc_client).
      update("1234", etag, data)

    assert_equal "Bill Example", customer.displayName
  end

  def test_customer_create
    stub_post("customers").
      with(headers: stub_headers,
           body: new_customer).
      to_return(
        status: 201,
        body: fixture("post_customer_success.json"))

    customer = BusinessCentral::Customer.new(bc_client).
      create(new_customer)

    assert_equal "Coho Winery", customer.displayName
    assert_equal "Company", customer.type
    assert_equal "USD", customer.currencyCode
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
