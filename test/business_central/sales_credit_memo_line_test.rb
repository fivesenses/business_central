require 'test_helper'

class BusinessCentral::SalesCreditMemoLineTest < Test::Unit::TestCase
  test "should initialize" do
    api = BusinessCentral::SalesCreditMemoLine.new(bc_client)
    assert_not_nil api
  end
end
