require 'test_helper'

class BusinessCentral::SalesInvoiceLineTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::SalesInvoiceLine.new(bc_client)
    assert_not_nil api
  end
end
