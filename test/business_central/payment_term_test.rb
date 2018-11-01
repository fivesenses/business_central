require 'test_helper'

class BusinessCentral::PaymentTermTest < Test::Unit::TestCase
  def test_initialize
    payment_term = BusinessCentral::PaymentTerm.new(bc_client)
    assert_not_nil payment_term
  end
end
