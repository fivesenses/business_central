##
# An object to handle authentication with BusinessCentral and to 
# provide the transport mechanism for interacting with the BusinessCentral API
#
module BusinessCentral
  class Client
    attr_reader :api_username, :api_password, :api_domain

    def initialize(opts = {})
      @test_mode = opts[:test_mode] ||= false
      @api_version = opts[:api_version] ||= BusinessCentral::API_VERSION
      @api_path = opts[:api_path] ||= BusinessCentral::API_PATH
      @api_domain = opts[:api_domain] ||= ENV['BC_DOMAIN']
      @api_username = opts[:api_username] ||= ENV['BC_USERNAME']
      @api_password = opts[:api_password] ||= ENV['BC_PASSWORD']
    end


    protected
    def basic_auth
      "#{@api_username}:#{@api_password}"
    end

    def host
      @test_mode ? BusinessCentral::HOST_TEST : BusinessCentral::HOST_PRODUCTION
    end
  end
end
