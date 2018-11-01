require 'test_helper'

class BusinessCentral::JournalTest < Test::Unit::TestCase
  def test_initialize
    journal = BusinessCentral::Journal.new(bc_client)
    assert_not_nil journal
  end
end
