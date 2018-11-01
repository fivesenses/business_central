require 'test_helper'

class BusinessCentral::PurchaseInvoiceLineTest < Test::Unit::TestCase
  def test_initialize
    purchaseInvoiceLine = BusinessCentral::PurchaseInvoiceLine.new(bc_client)
    assert_not_nil purchaseInvoiceLine
  end
end
