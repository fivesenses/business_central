##
# Provides access to the /salesOrders/{Id}/salesOrdersLines api
#

module BusinessCentral
  class SalesOrderLine < BusinessCentral::Base
    API_OBJECT_PARENT = "salesOrders"
    API_OBEJCT = "salesOrderLines"

    def get(sales_order_id, sales_order_line_id = nil)
      get_child(sales_order_id, sales_order_line_id)
    end
  end
end
