require 'test_helper'

class BusinessCentral::SalesOrderTest < Test::Unit::TestCase
  def test_method_missing_only_supports_methods_in_array
    api_salesOrder = BusinessCentral::SalesOrder.new(bc_client)
    assert_not_nil api_salesOrder

    assert_equal "foo is not supported", api_salesOrder.foo
  end

  def test_get_collection
    stub_get("salesOrders").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_salesOrders_200.json"))

    api_salesOrder = BusinessCentral::SalesOrder.new(bc_client)
    sales_orders = api_salesOrder.get

    assert sales_orders.is_a?(Array)
  end

  def test_get_with_id
    stub_get("salesOrders(1234)").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_salesOrder_200.json"))

    api_salesOrder = BusinessCentral::SalesOrder.new(bc_client)
    sales_order = api_salesOrder.get(1234)

    assert_equal "101001", sales_order.number
  end
end
