require 'test_helper'

class BusinessCentral::SalesInvoiceTest < Test::Unit::TestCase
  def test_initialize
    sales_invoice = BusinessCentral::SalesInvoice.new(bc_client)
    assert_not_nil sales_invoice
  end
end
