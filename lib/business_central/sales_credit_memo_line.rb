##
# Provides access to the /salesCreditMemos/{Id}/salesCreditMemoLines API
#

module BusinessCentral
  class SalesCreditMemoLine < BusinessCentral::Base
    API_OBJECT_PARENT = "salesCreditMemos"
    API_OBJECT = "salesCreditMemoLines"

    def get(sales_credit_memo_id, sales_credit_memo_line_id = nil)
      get_child(sales_credit_memo_id, sales_credit_memo_line_id)
    end
  end
end
