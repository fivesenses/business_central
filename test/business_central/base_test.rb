require 'test_helper'

class BusinessCentral::BaseTest < Test::Unit::TestCase
  test "should initialize with a client" do
    base = BusinessCentral::Base.new(bc_client)
    assert_not_nil base
    assert_not_nil base.client
  end
end
