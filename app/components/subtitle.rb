class Components::Subtitle < Components::Base
  def initialize(text)
    @text = text
  end

  def view_template
    Heading(level: 3, class: "mb-2") { @text }
  end
end
