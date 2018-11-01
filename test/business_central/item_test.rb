require 'test_helper'

class BusinessCentral::ItemTest < Test::Unit::TestCase
  def test_initialize
    item = BusinessCentral::Item.new(bc_client)
    assert_not_nil item
  end
end
