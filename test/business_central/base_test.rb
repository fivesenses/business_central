require 'test_helper'

class BusinessCentral::BaseTest < Test::Unit::TestCase
  def setup
    BusinessCentral::Base.const_set("API_OBJECT", "bar")
    BusinessCentral::Base.const_set("API_OBJECT_PARENT", "foo")
    BusinessCentral::Base.const_set("SUPPORTED_METHODS", [:get])
  end

  test "should initialize with a client" do
    base = BusinessCentral::Base.new(bc_client)
    assert_not_nil base
    assert_not_nil base.client
  end

  test "should build a URL with only a single parameter" do
    base = BusinessCentral::Base.new(bc_client)
    # base.const_set(API_OBJECT, "foo")
    url = base.build_url("1234")
    assert_equal '/foo(1234)/bar', url
  end

  test "should build a URL with multiple parameters" do
    base = BusinessCentral::Base.new(bc_client)
    url = base.build_url("1234", "4321")
    assert_equal "/foo(1234)/bar(4321)", url
  end
end
