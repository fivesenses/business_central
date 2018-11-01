require 'test_helper'

class BusinessCentral::PaymentMethodTest < Test::Unit::TestCase
  def test_initialize
    payment_method = BusinessCentral::PaymentMethod.new(bc_client)
    assert_not_nil payment_method
  end
end
