require 'test_helper'

class BusinessCentral::URLBuilderTest < Test::Unit::TestCase
  def test_initialize
    @builder = BusinessCentral::URLBuilder.new("FOO", "1234", { })
    assert_not_nil @builder
  end

  def test_build_path_with_parent
    @builder = BusinessCentral::URLBuilder.new("FOO", "1234", { })
    assert_equal "/FOO(1234)", @builder.url
  end

  def test_build_with_child_and_sequence
    @builder = BusinessCentral::URLBuilder.new("FOO", "1234", { child_path: "BAR",
                                                                child_id: "4321",
                                                                sequence: "10000" })
    assert_equal "/FOO(1234)/BAR?(4321, 10000)", @builder.url
  end

  def test_build_with_child_and_no_sequence
    @builder = BusinessCentral::URLBuilder.new("FOO", "1234", { child_path: "BAR",
                                                                child_id: "4321" })
    assert_equal "/FOO(1234)/BAR?(4321)", @builder.url
  end
end
