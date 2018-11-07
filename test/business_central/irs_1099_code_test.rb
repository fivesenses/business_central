require 'test_helper'

class BusinessCentral::Irs1099CodeTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::Irs1099Code.new(bc_client)
    assert_not_nil api
  end
end
