class AdapterSerializer < ApplicationAdapter
  def initialize(response)
    @response = response
  end

  def serialized_body
    @serialized_body = json_parser.call(@response.body)
  end
  alias_method :call, :serialized_body

  private

  alias_method :body, :serialized_body
end
