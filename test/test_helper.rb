require 'simplecov'
require 'simplecov-cobertura'
require 'webmock'
require 'webmock/fixtures'
require 'webmock/test_unit'

require 'rubygems'
require 'bundler'
require 'test/unit'
require 'business_central'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

SimpleCov.configure do
  clean_filters
  load_profile 'test_frameworks'
end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::CoberturaFormatter
]

SimpleCov.start

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
    api_domain: "cronos.com",
    api_username: "foo",
    api_password: "bar",
    test_mode: true
  })
end

def load_fixture(fixture)
  WebMock::Fixtures::Manager.run([fixture])
end

def register_fixture(fixture, operation, url)
  file = "test/fixtures/#{fixture.to_s}.json"
  WebMock::Fixtures::Manager.
    register_fixture_file(fixture, operation, url, file)
end

def fixture_url(url)
  "https://foo:bar@https://businesscentral.dynamics.com/v1.0/conos.com/api/beta/#{url}"
end
