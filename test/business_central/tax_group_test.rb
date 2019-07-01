require 'test_helper'

class BusinessCentral::TaxGroupTest < Test::Unit::TestCase
  def test_initialize
    tax_group = BusinessCentral::TaxGroup.new(bc_client)
    assert_not_nil tax_group
  end

  test "should return a list of taxGroups" do
    stub_get("taxGroups").
      with(headers: stub_headers).
      to_return(status: 200,
                body: fixture("get_taxGroups_200.json"))

    taxGroups = BusinessCentral::TaxGroup.new(bc_client).get()
    assert taxGroups.length > 1
    assert_equal "NO GST", taxGroups.first.code
  end
end
