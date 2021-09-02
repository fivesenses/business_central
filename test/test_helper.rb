require "rubygems"
require "bundler"
require "test/unit"
require "mocha/test_unit"

require "simplecov"
require "simplecov-cobertura"

require "webmock"
require "webmock/test_unit"

SimpleCov.configure do
  add_filter %r{^/opt/hostedtoolcache/}
  load_profile "test_frameworks"
end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::CoberturaFormatter
]

# Start SimpleCov before including the library
SimpleCov.start
require "business_central"

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
$LOAD_PATH.unshift(File.dirname(__FILE__))

class Test::Unit::TestCase; end

def bc_client
  BusinessCentral::Client.new({
    api_token: "FOOBAR",
    api_tenant: "987654321",
    api_host: "https://wiise.api.bc.dynamics.com",
    api_company_id: "123456789",
    api_version: "/v2.0",
    api_path: "/api/v2.0",
    test_mode: true
  })
end

def fixture_path
  File.expand_path("fixtures", __dir__)
end

def stub_get(path)
  stub_request(:get, api_url(path))
end

def stub_post(path)
  stub_request(:post, api_url(path))
end

def stub_patch(path)
  stub_request(:patch, api_url(path))
end

def stub_delete(path)
  stub_request(:delete, api_url(path))
end

def fixture(file)
  File.new(fixture_path + "/" + file)
end

def api_url(url)
  url += if url.index("?").nil?
           "?$schemaversion=2.0"
         elsif url.index("schemaversion").nil?
           "&$schemaversion=2.0"
         end
  "https://wiise.api.bc.dynamics.com/v2.0/987654321/sandbox2/api/v2.0/companies(123456789)#{url}"
end

def stub_headers
  {
    "Accept" => "*/*",
    "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
    "Authorization" => "Bearer FOOBAR",
    "Content-Type" => "application/json",
    "Host" => "wiise.api.bc.dynamics.com",
    "User-Agent" => "Ruby"
  }
end
