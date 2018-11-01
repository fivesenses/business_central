require 'test_helper'

class BusinessCentral::UnitOfMeasureTest < Test::Unit::TestCase
  def test_initialize
    unit = BusinessCentral::UnitOfMeasure.new(bc_client)
    assert_not_nil unit
  end
end
