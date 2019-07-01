require 'test_helper'

class BusinessCentral::CompanyTest < Test::Unit::TestCase
  def test_initialize
    api_company = BusinessCentral::Company.new(bc_client)
    assert_not_nil api_company
  end

  def test_company_success
    stub_get("companies(1234)").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_company_200.json"))

    company = BusinessCentral::Company.new(bc_client).get("1234")
    assert_equal "CRONUS AU", company.name
  end

  def test_companies_success
    stub_get("companies").
      with(headers: stub_headers).
      to_return(status: 200, body: fixture("get_companies_200.json"))

    companies = BusinessCentral::Company.new(bc_client).get
    assert_equal 1, companies.length
    assert_equal "CRONUS AU", companies.first.name
  end
end
