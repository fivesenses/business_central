require 'test_helper'

class BusinessCentral::CompanyInformationTest < Test::Unit::TestCase
  def test_initialize
    api = BusinessCentral::CompanyInformation.new(bc_client)
    assert_not_nil api
  end
end
