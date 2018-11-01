require 'test_helper'

class BusinessCentral::VendorPurchaseTest < Test::Unit::TestCase
  def test_initialize
    vendorPurchase = BusinessCentral::VendorPurchase.new(bc_client)
    assert_not_nil vendorPurchase
  end
end
