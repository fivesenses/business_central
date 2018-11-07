require 'test_helper'

class BusinessCentral::DimensionLineTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::DimensionLine.new(bc_client)
    assert_not_nil api
  end
end
