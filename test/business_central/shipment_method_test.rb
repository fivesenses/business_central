require 'test_helper'

class BusinessCentral::ShipmentMethodTest < Test::Unit::TestCase
  def test_initialize
    shipment_method = BusinessCentral::ShipmentMethod.new(bc_client)
    assert_not_nil shipment_method
  end
end
