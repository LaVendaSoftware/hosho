class AdapterSerializer < ApplicationAdapter
  def initialize(response)
    @response = response
  end

  def call = body

  private

  def body
    @body ||= json_parser.call(@response.body)
  end
end
