##
# Provides access to the /companyInformation({Id}) API
#

module BusinessCentral
  class CompanyInformation < BusinessCentral::Base
    API_OBJECT = "companyInformation"
    SUPPORTED_METHODS = [:get, :update]
  end
end
