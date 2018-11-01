require 'test_helper'

class BusinessCentral::SalesQuoteTest < Test::Unit::TestCase
  def test_initialize
    sales_quote = BusinessCentral::SalesQuote.new(bc_client)
    assert_not_nil sales_quote
  end
end
