# frozen_string_literal: true

class Components::Base < Phlex::HTML
  include Components
  include RubyUI
  # Include any helpers you want to be available across all components
  include Phlex::Rails::Helpers::Routes

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end

  private

  def helpers
    @helpers ||= ApplicationController.helpers
  end
  alias_method :h, :helpers
end
