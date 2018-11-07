require 'test_helper'

class BusinessCentral::CustomerPaymentsJournalTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::CustomerPaymentsJournal.new(bc_client)
    assert_not_nil api
  end
end
