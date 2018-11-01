##
# An object to build the request object
#

class BusinessCentral::RequestBuilder
  attr_accessor :request
  attr_reader :verb, :url, :etag, :data

  def initialize(client, opts = {})
    @client = client
    @verb = opts[:verb] if opts.has_key?(:verb)
    @url = opts[:url] if opts.has_key?(:url)
    @etag = opts[:etag] if opts.has_key?(:etag)
    @data = opts[:data] if opts.has_key?(:data)
    build
  end

  def build
    @request = request_object.new(uri)
    @request.content_type = "application/json"
    @request.basic_auth(@client.api_username, @client.api_password)
    add_etag
    add_data
  end

  def add_etag
    return if @etag.nil?
    @request['If-Match'] = @etag
  end

  def add_data
    return if @data.nil?
    @request.body = JSON.generate(@data)
  end

  def request_object
    Object.const_get("Net::HTTP::#{@verb.capitalize}")
  end

  def uri
    URI(@client.base_url + @url)
  end
end
