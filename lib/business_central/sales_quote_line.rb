##
# Provides access to the /salesQuotes/{Id}/salesQuotesLines API
#

module BusinessCentral
  class SalesQuoteLine < BusinessCentral::Base
    API_OBJECT_PARENT = "salesQuotes"
    API_OBJECT = "salesQuoteLines"

    def get(sales_quote_id, sales_quote_line_id = nil, sequence = nil)
      url = build_url(sales_quote_id, build_options(sales_quote_line_id, sequence))
    end
  end
end
