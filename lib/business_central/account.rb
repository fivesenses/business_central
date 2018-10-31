##
# Provides access to the /accounts API
#

module BusinessCentral
  class Account < BusinessCentral::Base
    API_OBJECT = "accounts"
    SUPPORTED_METHODS = [:get]
  end
end
