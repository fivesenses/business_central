require 'test_helper'

class BusinessCentral::AgedAccountsReceivableTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::AgedAccountsReceivable.new(bc_client)
    assert_not_nil api
  end
end
