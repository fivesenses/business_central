require 'test_helper'

class BusinessCentral::TrialBalanceTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::TrialBalance.new(bc_client)
    assert_not_nil api
  end
end
