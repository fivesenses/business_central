##
# Provides access to the /incomeStatement API
#

module BusinessCentral
  class IncomeStatement < BusinessCentral::Base
    API_OBJECT = "incomeStatement"
    SUPPORTED_METHODS = [:get]
  end
end
