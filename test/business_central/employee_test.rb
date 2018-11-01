require 'test_helper'

class BusinessCentral::EmployeeTest < Test::Unit::TestCase
  def test_initialize
    employee = BusinessCentral::Employee.new(bc_client)
    assert_not_nil employee
  end
end
