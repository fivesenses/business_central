require 'test_helper'

class BusinessCentral::DimensionTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::Dimension.new(bc_client)
    assert_not_nil api
  end
end
