##
# Provides access to the /salesOrders/{Id}/salesOrdersLines api
#

module BusinessCentral
  class SalesOrderLine < BusinessCentral::Base
    API_OBJECT_PARENT = "salesOrders"
    API_OBEJCT = "salesOrderLines"

    def get(sales_order_id, sales_order_line_id = nil, sequence = nil)
      url = build_url(sales_order_id, build_options(sales_order_line_id, sequence))

    end
  end
end
