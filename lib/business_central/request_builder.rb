##
# An object to build the request object
#

class BusinessCentral::RequestBuilder
  attr_accessor :request
  attr_reader :verb, :url, :etag, :data

  # @param client [BusinessCentral::Client]
  # @param opts [Hash] Options used to build the request
  #
  def initialize(client, opts = {})
    @client = client
    @verb = opts[:verb] if opts.has_key?(:verb)
    @url = opts[:url] if opts.has_key?(:url)
    @etag = opts[:etag] if opts.has_key?(:etag)
    @data = opts[:data] if opts.has_key?(:data)
    build
  end

  # Create the appropriate request object
  #
  # Populates @request with the constructed object
  def build
    @request = request_object.new(uri)
    @request.content_type = "application/json"
    @request.basic_auth(@client.api_username, @client.api_password)
    add_etag
    add_data
  end

  # If an etag is supplied, add it to the request in an ['If-Match'] header
  #
  def add_etag
    return if @etag.nil?
    @request['If-Match'] = @etag
  end

  # If form data is supplied, add it to the request body as JSON
  #
  def add_data
    return if @data.nil?
    @request.body = JSON.generate(@data)
  end

  # @returns [Net::HTTP::Request] object, based on the verb supplied in the
  # initialization opts Hash
  #
  def request_object
    Object.const_get("Net::HTTP::#{@verb.capitalize}")
  end

  # Contstruct URI for the request
  #
  # @returns [URI]
  #
  def uri
    URI(@client.base_url + @url)
  end
end
