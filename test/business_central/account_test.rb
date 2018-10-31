require 'test_helper'

class BusinessCentral::AccountTest < Test::Unit::TestCase
  def test_initialize
    api_account = BusinessCentral::Account.new(bc_client)
    assert_not_nil api_account
  end

  def test_get_accounts
    stub_get("accounts").
      with(headers: stub_headers).
      to_return( status: 200, body: fixture("get_accounts_success.json"))

    accounts = BusinessCentral::Account.new(bc_client).get
    assert accounts.length > 0
  end

  def test_get_account
    stub_get("accounts/1234").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_account_success.json"))

    account = BusinessCentral::Account.new(bc_client).get("1234")
    assert_equal "Cleaning", account.displayName
  end
end
