require 'test_helper'

class BusinessCentral::SalesCreditMemoTest < Test::Unit::TestCase
  def test_initialize
    sales_credit_memo = BusinessCentral::SalesCreditMemo.new(bc_client)
    assert_not_nil sales_credit_memo
  end
end
