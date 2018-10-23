##
# An object to handle authentication with BusinessCentral and to 
# provide the transport mechanism for interacting with the BusinessCentral API
#
module BusinessCentral
  class Client
    attr_reader :api_username, :api_password, :api_tenant, :api_company_id

    def initialize(opts = {})
      @test_mode = opts[:test_mode] ||= false
      @api_version = opts[:api_version] ||= BusinessCentral::API_VERSION
      @api_path = opts[:api_path] ||= BusinessCentral::API_PATH
      @api_tenant = opts[:api_tenant] ||= ENV['BC_TENANT']
      @api_username = opts[:api_username] ||= ENV['BC_USERNAME']
      @api_password = opts[:api_password] ||= ENV['BC_PASSWORD']
      @api_company_id = opts[:api_company_id] ||= ENV['BC_COMPANY_ID']
    end

    def base_url
      url = "#{host}#{@api_version}/#{@api_tenant}#{@api_path}"
      unless @api_company_id.nil?
        url += "/#{@api_company_id}"
      end
      url
    end

    def get(url)
      Typhoeus::Request.get(base_url + url, userpwd: basic_auth)
    end

    def post(url, data)
      Typhoeus::Request.post(base_url + url,
                             userpwd: basic_auth,
                             body: data)
    end

    def patch(url, data)
      Typhoeus::Request.patch(base_url + url,
                              userpwd: basic_auth,
                              body: data)
    end

    def dataset(response)
      json = JSON.parse(response.body)
      if !json["value"].nil?
        json["value"]
      else
        json
      end
    rescue
      {}
    end

    protected
    def basic_auth
      "#{@api_username}:#{@api_password}"
    end

    def host
      @test_mode ? BusinessCentral::ENDPOINT_TEST : BusinessCentral::ENDPOINT_PRODUCTION
    end
  end
end
