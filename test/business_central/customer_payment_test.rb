require 'test_helper'

class BusinessCentral::CustomerPaymentTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::CustomerPayment.new(bc_client)
    assert_not_nil api
  end
end
