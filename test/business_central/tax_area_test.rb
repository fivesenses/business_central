require 'test_helper'

class BusinessCentral::TaxAreaTest < Test::Unit::TestCase
  def test_initialize
    tax_area = BusinessCentral::TaxArea.new(bc_client)
    assert_not_nil tax_area
  end

  test "should return a list of taxAreas" do
    stub_get("taxAreas").
      with(headers: stub_headers).
      to_return(status: 200,
                body: fixture("get_taxAreas_200.json"))

    taxAreas = BusinessCentral::TaxArea.new(bc_client).get()
    assert taxAreas.length > 1
    assert_equal "INTERCO", taxAreas.first.code
  end
end
