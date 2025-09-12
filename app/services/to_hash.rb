class ToHash < ApplicationService
  def initialize(content, fallback = {})
    @content = content
    @fallback = fallback
  end

  def call
    return @fallback if @content.blank?

    ActiveSupport::HashWithIndifferentAccess.new(content_hash)
  end

  private

  def content_hash
    @content.is_a?(Hash) ? @content : JSON.parse(@content)
  rescue JSON::ParserError
    @fallback
  end
end
