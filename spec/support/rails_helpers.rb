module RailsHelpers
  def helpers
    @helpers ||= ApplicationController.helpers
  end
  alias_method :h, :helpers

  def translate(key, **)
    I18n.t(key, **)
  end
  alias_method :t, :translate
end

RSpec.configure do |config|
  config.include RailsHelpers
end
