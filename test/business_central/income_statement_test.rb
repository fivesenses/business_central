require 'test_helper'

class BusinessCentral::IncomeStatementTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::IncomeStatement.new(bc_client)
    assert_not_nil api
  end
end
