class Components::Sidebar::Heading < Components::Base
  def initialize(text)
    @text = text
  end

  def view_template
    Text(class: text_classes) { @text }
  end

  private

  def text_classes
    "text-gray-400 dark:text-gray-100 text-xs uppercase font-semibold leading-none"
  end
end
