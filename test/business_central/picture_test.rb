require 'test_helper'

class BusinessCentral::PictureTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::Picture.new(bc_client)
    assert_not_nil api
  end
end
