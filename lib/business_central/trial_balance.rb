##
# Provides access to the /trialBalance API
#

module BusinessCentral
  class TrialBalance < BusinessCentral::Base
    API_OBJECT = "trialBalance"
    SUPPORTED_METHOD = [:get]
  end
end
