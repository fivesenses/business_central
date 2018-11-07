require 'test_helper'

class BusinessCentral::AgedAccountsPayableTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::AgedAccountsPayable.new(bc_client)
    assert_not_nil api
  end
end
