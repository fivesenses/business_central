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

    customers = BusinessCentral::Customer.new(bc_client).customers
    assert customers.length > 0
  end

  def test_customer_success
    stub_get("customers/1234").with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_customer_success.json"))

    customer = BusinessCentral::Customer.new(bc_client).customer("1234")
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
      update_customer("1234", etag, data)

    assert_equal "Bill Example", customer.displayName
  end
end
