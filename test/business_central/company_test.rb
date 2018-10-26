require 'test_helper'

class BusinessCentral::CompanyTest < Test::Unit::TestCase
  def test_initialize
    api_company = BusinessCentral::Company.new(bc_client)
    assert_not_nil api_company
  end

  def test_company_success
    stub_get("companies/1234").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_company_success.json"))

    company = BusinessCentral::Company.new(bc_client).company("1234")
    assert_equal "CRONUS AU", company.name
    assert_equal "CRONUS AU", company.displayName
  end

  def test_companies_success
    stub_get("companies").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_companies_success.json"))

    companies = BusinessCentral::Company.new(bc_client).companies
    assert_equal 1, companies.length
    assert_equal "CRONUS AU", companies.first.displayName
  end

end
