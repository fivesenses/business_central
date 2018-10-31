require 'rubygems'
require 'bundler'
require 'test/unit'

require 'simplecov'
require 'simplecov-cobertura'

require 'webmock'
require 'webmock/test_unit'


SimpleCov.configure do
  add_filter %r{^/opt/hostedtoolcache/}
  load_profile 'test_frameworks'
end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::CoberturaFormatter
]

# Start SimpleCov before including the library
SimpleCov.start
require 'business_central'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

class Test::Unit::TestCase; end

def bc_client
  BusinessCentral::Client.new({
    api_tenant: "cronos.com",
    api_username: "foo",
    api_password: "bar",
    test_mode: true
  })
end

def fixture_path
  File.expand_path('fixtures', __dir__)
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
  File.new(fixture_path + '/' + file)
end

def api_url(url)
  "https://api.businesscentral.dynamics.com/v1.0/cronos.com/api/beta/#{url}"
end

def stub_headers
  {
    'Accept'=>'*/*',
    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    'Authorization'=>'Basic Zm9vOmJhcg==',
    'Host'=>'api.businesscentral.dynamics.com',
    'User-Agent'=>'Ruby'
  }
end
