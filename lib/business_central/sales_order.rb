##
# Access the /salesOrders API on Business Central
#
module BusinessCentral
  class SalesOrder < BusinessCentral::Base
    API_OBJECT = "salesOrders"
    SUPPORTED_METHODS = [:get, :create, :update, :delete]


    def create_sales_order(data)
      create(API_OBJECT, data)
    end

    def update_sales_order(id, etag, data)
      update(API_OBJECT, id, etag, data).first
    end

    def delete_sales_order(id, etag)
      delete(API_OBJECT, id, etag)
    end
  end
end
