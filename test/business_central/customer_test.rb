require 'test_helper'

class BusinessCentral::CustomerTest < Test::Unit::TestCase
  def test_initialize
    api_customer = BusinessCentral::Customer.new(bc_client)
    assert_not_nil api_customer
  end

  def test_customers_success
    fixture_setup(:get_customers_success)
    customers = BusinessCentral::Customer.new(bc_client).customers
    assert customers.length > 0
  end

  def test_customer_success
    fixture_setup(:get_customer_success)
    customer = BusinessCentral::Customer.new(bc_client).customer("1234")
    assert_equal "Chicken Feet", customer.displayName
  end

  def test_customer_update
    fixture_setup(:patch_customer_success)
    data = { displayName: "Bill Example" }
    etag = "W/\"JzQ0O1JpdzI0TmU4NEpRS0R6cHAzTkVBdHpxYXorc0VLbnJ4OVQyTFJjclREeG89MTswMDsn\""

    customer = BusinessCentral::Customer.new(bc_client).
      update_customer("1234", etag, data)

    assert_equal "Bill Example", customer.displayName
  end

  def register_fixtures
    register_fixture(:get_customers_success, :get, fixture_url("customers"))
    register_fixture(:get_customer_success, :get, fixture_url("customers/1234"))
    register_fixture(:patch_customer_success, :patch, fixture_url("customers/1234"))
  end
end
