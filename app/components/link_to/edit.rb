class Components::LinkTo::Edit < Components::Base
  include Phlex::Rails::Helpers::LinkTo

  def initialize(record, prefix_path: nil)
    @record = record
    @prefix_path = prefix_path
  end

  def view_template
    link_to("Edit", url, class: link_classes)
  end

  private

  def url
    [@prefix_path, @record].compact
  end

  def link_classes
    [
      "whitespace-nowrap inline-flex items-center justify-center rounded-md ",
      "font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 ",
      "focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50 border ",
      "border-input bg-background shadow-sm hover:bg-accent hover:text-accent-foreground ",
      "px-4 py-2 h-9 text-sm"
    ]
  end
end
