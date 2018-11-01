require 'test_helper'

class BusinessCentral::TaxAreaTest < Test::Unit::TestCase
  def test_initialize
    tax_area = BusinessCentral::TaxArea.new(bc_client)
    assert_not_nil tax_area
  end
end
