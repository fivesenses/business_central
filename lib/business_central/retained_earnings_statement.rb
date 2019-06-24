##
# Provides access to the /retainedEarningsStatement API
#
module BusinessCentral
  class RetainedEarningsStatement < BusinessCentral::Base
    API_OBJECT = "retainedEarningsStatement"
    SUPPORTED_METHODS = [:get]
  end
end
