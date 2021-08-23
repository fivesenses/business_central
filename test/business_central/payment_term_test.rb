require "test_helper"

class BusinessCentral::PaymentTermTest < Test::Unit::TestCase
  def test_initialize
    payment_term = BusinessCentral::PaymentTerm.new(bc_client)
    assert_not_nil payment_term
  end

  test "should return a list of paymentTerms" do
    stub_get("/paymentTerms")
      .with(headers: stub_headers)
      .to_return(
        status: 200,
        body: fixture("get_paymentTerms_200.json")
      )

    terms = BusinessCentral::PaymentTerm.new(bc_client).get
    assert terms.is_a?(Array)
  end

  test "should get a single PaymentTerm" do
    stub_get("/paymentTerms(1234)")
      .with(headers: stub_headers)
      .to_return(
        status: 200,
        body: fixture("get_paymentTerm_200.json")
      )

    term = BusinessCentral::PaymentTerm.new(bc_client).get("1234")

    assert_equal "7 DAYS", term.code
  end
end
