require "net/http"

class AdapterClient < ApplicationAdapter
  SUCCESSFULLY_RANGE_CODES = 200..299

  def success? = code.in?(SUCCESSFULLY_RANGE_CODES.to_a)

  def code
    response.code.to_i
  end

  def status
    Rack::Utils::SYMBOL_TO_STATUS_CODE.invert[code]
  end

  def failure?
    !success?
  end

  def serialized_body
    @serialized_body ||= AdapterSerializer.call(@response)
  end

  def body
    return if status == :unauthorized
    return serialized_body unless defined?(self.class::SERIALIZER)

    self.class::SERIALIZER.call(@response)
  end

  def errors =
    ActiveSupport::HashWithIndifferentAccess.new(serialized_body[:errors]).presence || {}

  private

  attr_reader :response

  def make_request(verb_class, path: nil, body: nil)
    uri = URI(url(path))

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == "https")

    request = verb_class.new(uri, headers)
    request.body = URI.encode_www_form(body) if body.present?

    @response = http.request(request)
  end

  def url(path = nil)
    return [base_url, "/", path].join unless defined?(self.class::BASE_URL)

    [self.class::BASE_URL, "/", path].join
  end

  def headers
    {"Content-Type": "application/json"}
  end

  def get(...)
    make_request(Net::HTTP::Get, ...)
  end

  def post(...)
    make_request(Net::HTTP::Post, ...)
  end

  def put(...)
    make_request(Net::HTTP::Put, ...)
  end
end
