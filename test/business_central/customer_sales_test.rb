require 'test_helper'

class BusinessCentral::CustomerSalesTest < Test::Unit::TestCase
  def test_initialize
    customer_sales = BusinessCentral::CustomerSales.new(bc_client)
    assert_not_nil customer_sales
  end
end
