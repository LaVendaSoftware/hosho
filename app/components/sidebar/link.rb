class Components::Sidebar::Link < Components::Base
  include Phlex::Rails::Helpers::LinkTo

  def initialize(label:, url:)
    @label = label
    @url = url
  end

  def view_template
    link_to(@label, @url, class: "block rounded px-3 py-2 hover:bg-muted")
  end
end
