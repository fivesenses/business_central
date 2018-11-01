require 'test_helper'

class BusinessCentral::TaxGroupTest < Test::Unit::TestCase
  def test_initialize
    tax_group = BusinessCentral::TaxGroup.new(bc_client)
    assert_not_nil tax_group
  end
end
