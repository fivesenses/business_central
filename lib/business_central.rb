require 'net/http'
require 'json'

require 'business_central/api_methods'
require 'business_central/base'
require 'business_central/request_builder'
require 'business_central/url_builder'
require 'business_central/client'
require 'business_central/version'
require 'business_central/response/response_handler'

require 'business_central/account'
require 'business_central/aged_accounts_payable'
require 'business_central/aged_accounts_receivable'
require 'business_central/balance_sheet'
require 'business_central/cash_flow_statement'
require 'business_central/company'
require 'business_central/company_information'
require 'business_central/countries_region'
require 'business_central/currency'
require 'business_central/customer'
require 'business_central/customer_financial_details'
require 'business_central/customer_payment'
require 'business_central/customer_payments_journal'
require 'business_central/customer_sales'
require 'business_central/dimension'
require 'business_central/dimension_line'
require 'business_central/employee'
require 'business_central/general_ledger_entry'
require 'business_central/income_statement'
require 'business_central/irs_1099_code'
require 'business_central/item'
require 'business_central/item_category'
require 'business_central/journal'
require 'business_central/journal_line'
require 'business_central/payment_method'
require 'business_central/payment_term'
require 'business_central/picture'
require 'business_central/purchase_invoice'
require 'business_central/purchase_invoice_line'
require 'business_central/retained_earnings_statement'
require 'business_central/sales_credit_memo'
require 'business_central/sales_credit_memo_line'
require 'business_central/sales_invoice'
require 'business_central/sales_invoice_line'
require 'business_central/sales_order'
require 'business_central/sales_order_line'
require 'business_central/sales_quote'
require 'business_central/sales_quote_line'
require 'business_central/shipment_method'
require 'business_central/subscription'
require 'business_central/tax_area'
require 'business_central/tax_group'
require 'business_central/trial_balance'
require 'business_central/unit_of_measure'
require 'business_central/vendor'
require 'business_central/vendor_purchase'


module BusinessCentral
  API_PATH = "/api/v1.0"
  API_VERSION = "/v1.0"
  ENDPOINT_TEST = "https://api.businesscentral.dynamics.com"
  ENDPOINT_PRODUCTION = "https://api.businesscentral.dynamics.com"
end

ServiceUnavailableError = Class.new(StandardError)
ServiceError = Class.new(StandardError)
RateLimitError = Class.new(StandardError)
