require 'test_helper'

class BusinessCentral::JournalLineTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::JournalLine.new(bc_client)
    assert_not_nil api
  end
end
