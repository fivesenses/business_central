require 'test_helper'

class BusinessCentral::ItemCategoryTest < Test::Unit::TestCase
  def test_initialize
    category = BusinessCentral::ItemCategory.new(bc_client)
    assert_not_nil category
  end
end
