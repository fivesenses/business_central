require 'typhoeus'
require 'json'

require 'business_central/constants'
require 'business_central/client'


ServiceUnavailableError = Class.new(StandardError)
