require "test_helper"

class BusinessCentral::ShipmentMethodTest < Test::Unit::TestCase
  def test_initialize
    shipment_method = BusinessCentral::ShipmentMethod.new(bc_client)
    assert_not_nil shipment_method
  end

  test "should return a list of shipmentMethods" do
    stub_get("/shipmentMethods")
      .with(headers: stub_headers)
      .to_return(
        status: 200,
        body: fixture("get_shipmentMethods_200.json")
      )

    shipment_methods = BusinessCentral::ShipmentMethod.new(bc_client).get()
    assert shipment_methods.length > 1
    assert_equal "DELIVERY", shipment_methods.first.displayName
  end
end
