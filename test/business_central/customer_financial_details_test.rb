require "test_helper"

class BusinessCentral::CustomerFinancialDetailsTest < Test::Unit::TestCase
  def test_initialize
    cust_details = BusinessCentral::CustomerFinancialDetails.new(bc_client)
    assert_not_nil cust_details
  end

  test "should retrieve all customerFinancialDetails" do
    # stub_get("?expand=customerFinancialDetail&schemaVersion=2.0")
    stub_get("/customerFinancialDetails?schemaVersion=2.0")
      .with(headers: stub_headers)
      .to_return(
        status: 200,
        body: fixture("get_customer_financial_details_200.json")
      )
    cust_details = BusinessCentral::CustomerFinancialDetails.new(bc_client).get
    assert cust_details.is_a?(Array)
    assert cust_details.length > 0
  end
end
