require 'typhoeus'
require 'json'

require 'business_central/base'
require 'business_central/client'
require 'business_central/company'
require 'business_central/response/response_handler'


module BusinessCentral
  API_PATH = "/api/beta"
  API_VERSION = "/v1.0"
  ENDPOINT_TEST = "https://api.businesscentral.dynamics.com"
  ENDPOINT_PRODUCTION = "https://api.businesscentral.dynamics.com"
end

ServiceUnavailableError = Class.new(StandardError)
