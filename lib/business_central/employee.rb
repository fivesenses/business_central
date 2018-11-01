##
# Provides access to the /employees API
#

module BusinessCentral
  class Employee < BusinessCentral::Base
    API_OBJECT = "employees"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
