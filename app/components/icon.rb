class Components::Icon < Components::Base
  def initialize(icon)
    @icon = icon
  end

  def view_template
    i { ApplicationController.helpers.phosphor_icon(@icon) }
  end
end
