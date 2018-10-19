require 'test_helper'

class BusinessCentral::ClientTest < Test::Unit::TestCase
  def test_initialize
    client = bc_client

    assert_not_nil client
    assert_equal "cronos.com", client.api_domain
    assert_equal "foo", client.api_username
    assert_equal "bar", client.api_password
  end
end
