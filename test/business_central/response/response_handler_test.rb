require 'test_helper'

class BusinessCentral::Response::ResponseHandlerTest < Test::Unit::TestCase

  test "should process the returned data" do
    response = BusinessCentral::Response::ResponseHandler.new(sample_company.to_json)
    company = response.compiled_data.first
    assert_equal "1234", company.id
  end

  test "should process returned data with an address" do
    sample = sample_company.merge({"address":sample_address}).to_json
    response = BusinessCentral::Response::ResponseHandler.new(sample)
    company = response.compiled_data.first
    assert_equal "1234 Fake St", company.address[:street]
  end

  test "should process data returned with customer financials" do
    sample = sample_company.merge({"customerFinancialDetails":sample_financial_data}).to_json
    response = BusinessCentral::Response::ResponseHandler.new(sample)
    company = response.compiled_data.first

    assert_equal "616", company.customerFinancialDetails.first.balance
  end

  def sample_company
    {
      "@odata.etag":"ETAG",
      "id":"1234",
      "number":"4321",
      "displayName":"Chicken Feet"
    }
  end

  def sample_address
    {
      "street":"1234 Fake St",
      "city":"Fake Town",
      "state":"EX",
      "countryLetterCode":"AU",
      "postalCode":"6000"
    }
  end

  def sample_financial_data
    [{
      "@odata.etag": "ETAG_FINANCIAL",
      "id":"1234",
      "number":"4321",
      "balance":"616",
      "totalSalesExcludingTax":16380.55,
      "overdueAmount":616
    }]
  end
end
