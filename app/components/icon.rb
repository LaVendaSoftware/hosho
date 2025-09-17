class Components::Icon < Components::Base
  def initialize(icon, **options)
    @icon = icon
    @options = options
  end

  def view_template
    return if @icon.blank?

    i { h.phosphor_icon(@icon, **@options) }
  end
end
