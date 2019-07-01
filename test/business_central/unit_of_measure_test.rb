require 'test_helper'

class BusinessCentral::UnitOfMeasureTest < Test::Unit::TestCase
  def test_initialize
    unit = BusinessCentral::UnitOfMeasure.new(bc_client)
    assert_not_nil unit
  end

  test "should get all unitsOfMeasure" do
    stub_get("unitsOfMeasure").
      with(headers: stub_headers).
      to_return(status: 200,
                body: fixture("get_unitsOfMeasure_200.json"))

    unitsOfMeasure = BusinessCentral::UnitOfMeasure.new(bc_client).get()
    assert unitsOfMeasure.length > 1
    assert_equal "Box", unitsOfMeasure.first.displayName
  end
end
