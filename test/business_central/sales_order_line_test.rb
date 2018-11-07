require 'test_helper'

class BusinessCentral::SalesOrderLineTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::SalesOrderLine.new(bc_client)
    assert_not_nil api
  end
end
