##
# Provides access to the /irs1099Codes API
#

module BusinessCentral
  class Irs1099Code < BusinessCentral::Base
    API_OBJECT = "irs1099Codes"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]
  end
end
