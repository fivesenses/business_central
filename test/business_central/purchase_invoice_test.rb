require 'test_helper'

class BusinessCentral::PurchaseInvoiceTest < Test::Unit::TestCase
  def test_initialize
    purchase_invoice = BusinessCentral::PurchaseInvoice.new(bc_client)
    assert_not_nil purchase_invoice
  end
end
