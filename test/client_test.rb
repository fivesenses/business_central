require 'test_helper'

class BusinessCentral::ClientTest < Test::Unit::TestCase
  def test_initialize
    client = bc_client

    assert_not_nil client
    assert_equal "cronos.com", client.api_tenant
    assert_equal "foo", client.api_username
    assert_equal "bar", client.api_password
  end

  def test_base_url
    client = bc_client

    assert_equal "https://api.businesscentral.dynamics.com/v1.0/cronos.com/api/beta",
      client.base_url
  end

  def test_base_url_with_company_id
    client = BusinessCentral::Client.new({
      api_tenant: "cronos.com",
      api_username: "foo",
      api_password: "bar",
      test_mode: true,
      api_company_id: "company_id"
    })

    assert_equal "https://api.businesscentral.dynamics.com/v1.0/cronos.com/api/beta/company_id",
      client.base_url
  end
end
