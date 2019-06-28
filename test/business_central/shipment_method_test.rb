require 'test_helper'

class BusinessCentral::ShipmentMethodTest < Test::Unit::TestCase
  def test_initialize
    shipment_method = BusinessCentral::ShipmentMethod.new(bc_client)
    assert_not_nil shipment_method
  end

  test "should return a list of shipmentMethods" do
    stub_get("shipmentMethods").
      with(headers: stub_headers).
      to_return(status: 200,
                body: fixture("get_shipmentMethods_200.json"))

    shipmentMethods = BusinessCentral::ShipmentMethod.new(bc_client).get()
    assert shipmentMethods.length > 1
    assert_equal "DELIVERY", shipmentMethods.first.displayName
  end
end
