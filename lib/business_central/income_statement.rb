##
# Provides access to the /incomeStatement API
#

module BusinessCentral
  class IncomeStatement < Test::Unit::TestCase
    API_OBJECT = "incomeStatement"
    SUPPORTED_METHODS = [:get]
  end
end
