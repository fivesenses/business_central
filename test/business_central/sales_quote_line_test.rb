require 'test_helper'

class BusinessCentral::SalesQuoteLineTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::SalesQuoteLine.new(bc_client)
    assert_not_nil api
  end
end
