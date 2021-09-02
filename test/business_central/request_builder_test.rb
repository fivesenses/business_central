require "test_helper"

class BusinessCentral::RequestBuilderTest < Test::Unit::TestCase
  def test_initialize
    @builder = BusinessCentral::RequestBuilder.new(
      bc_client,
      {
        verb: "Get",
        url: "/customers"
      }
    )
    assert_not_nil @builder
    assert_equal "Get", @builder.verb
    assert_equal "/customers?$schemaversion=2.0", @builder.url
  end

  def test_request_object
    @builder = BusinessCentral::RequestBuilder.new(
      bc_client,
      {
        verb: "Get",
        url: "/customers"
      }
    )
    assert_equal Net::HTTP::Get, @builder.request_object
  end

  def test_uri
    @builder = BusinessCentral::RequestBuilder.new(
      bc_client,
      {
        verb: "Get",
        url: "/customers"
      }
    )
    assert_equal URI("#{bc_client.base_url}/customers?$schemaversion=2.0"), @builder.uri
  end

  def test_build
    @builder = BusinessCentral::RequestBuilder.new(
      bc_client,
      {
        verb: "Get",
        url: "/customers"
      }
    )
    assert_equal "Net::HTTP::Get", @builder.request.class.to_s
  end

  def test_build_adds_etag
    @builder = BusinessCentral::RequestBuilder.new(
      bc_client,
      {
        verb: "Get",
        etag: "FOOBAR",
        url: "/customers"
      }
    )
    assert_equal ["FOOBAR"], @builder.request.get_fields("If-Match")
  end

  def test_build_adds_data
    @builder = BusinessCentral::RequestBuilder.new(
      bc_client,
      {
        verb: "Post",
        url: "/customers",
        data: {
          displayName: "Chicken Feet"
        }
      }
    )
  end
end
