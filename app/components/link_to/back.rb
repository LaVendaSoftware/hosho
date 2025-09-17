class Components::LinkTo::Back < Components::Base
  include Phlex::Rails::Helpers::LinkTo

  def initialize(link)
    @link = link
  end

  def view_template
    return if @link.blank?

    link_to(@link) do
      Components::Icon("arrow-left")
    end
  end

  private

  def link_class
    [
      "flex whitespace-nowrap inline-flex items-center justify-center rounded-md ",
      "font-medium transition-colors disabled:pointer-events-none disabled:opacity-50 ",
      "focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring ",
      "aria-disabled:pointer-events-none aria-disabled:opacity-50 aria-disabled:cursor-not-allowed ",
      "px-2 h-9 text-sm border border-input bg-background shadow-sm hover:bg-accent hover:text-accent-foreground"
    ]
  end
end
