require "test_helper"

class BusinessCentral::CurrencyTest < Test::Unit::TestCase
  def test_initialize
    currency = BusinessCentral::Currency.new(bc_client)
    assert_not_nil currency
  end
end
