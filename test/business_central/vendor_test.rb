require 'test_helper'

class BusinessCentral::VendorTest < Test::Unit::TestCase
  def test_initialize
    vendor = BusinessCentral::Vendor.new(bc_client)
    assert_not_nil vendor
  end
end
