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
        url += "/companies/#{@api_company_id}"
      end
      url
    end

    def get(url)
      request = build_request({ verb: "Get", url: url })
      perform_request(request)
    end

    def post(url, data)
      request = build_request({ verb: "Post", url: url, data: data })
      perform_request(request)
    end

    def patch(url, etag, data)
      request = build_request({ verb: "Patch", url: url, data: data, etag: etag })
      perform_request(request)
    end

    def delete(url, etag)
      request = build_request({ verb: "Delete", url: url, etag: etag })
      perform_request(request)
    end

    def dataset(response)
      json = JSON.parse(response.body)
      if !json["value"].nil?
        json["value"]
      else
        json
      end
    # rescue
    #   {}
    end

    protected
    def get_uri(url)
      URI(base_url + url)
    end

    def build_request(opts)
      BusinessCentral::RequestBuilder.new(self, opts).request
    end

    def perform_request(request)
      Net::HTTP.start(request.uri.hostname, request.uri.port, use_ssl: true) do |http|
        http.request(request)
      end
    end

    def basic_auth
      "#{@api_username}:#{@api_password}"
    end

    def host
      @test_mode ? BusinessCentral::ENDPOINT_TEST : BusinessCentral::ENDPOINT_PRODUCTION
    end
  end
end
