require 'test_helper'

class BusinessCentral::CompanyTest < Test::Unit::TestCase
  def test_initialize
    api_company = BusinessCentral::Company.new(bc_client)
    assert_not_nil api_company
  end

  def test_company_success
    register_fixtures
    load_fixture(:get_company_success)
    company = BusinessCentral::Company.new(bc_client).company("1234")
    assert_equal "CRONUS AU", company.name
    assert_equal "CRONUS AU", company.displayName
  end

  def test_companies_success
    register_fixtures
    load_fixture(:get_companies_success)
    companies = BusinessCentral::Company.new(bc_client).companies
    assert_equal 1, companies.length
    assert_equal "CRONUS AU", companies.first.displayName
  end

  def register_fixtures
    register_fixture(:get_companies_success, :get, fixture_url("companies"))
    register_fixture(:get_company_success, :get, fixture_url("companies/1234"))
  end
end
