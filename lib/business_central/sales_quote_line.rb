##
# Provides access to the /salesQuotes/{Id}/salesQuotesLines API
#

module BusinessCentral
  class SalesQuoteLine < BusinessCentral::Base
    API_OBJECT_PARENT = "salesQuotes"
    API_OBJECT = "salesQuoteLines"

    def get(sales_quote_id, sales_quote_line_id = nil)
      get_child(sales_quote_id, sales_quote_line_id)
    end
  end
end
