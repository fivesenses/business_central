##
# Access the /FivenetCustomer API on BusinessCentral
# Used for the Pipelabs API Extension 
#
module BusinessCentral
    class FivenetCustomer < BusinessCentral::Base
      API_OBJECT = "FivenetCustomer"
      SUPPORTED_METHODS = [:get, :create, :update, :delete, :collection_filter]
    end
  end
  