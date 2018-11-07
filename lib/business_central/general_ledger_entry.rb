##
# Provides access to the /generalLedgeEntries API
#

module BusinessCentral
  class GeneralLedgerEntry < BusinessCentral::Base
    API_OBJECT = "generalLedgerEntries"
    SUPPORTED_METHODS = [:get]
  end
end
