class Components::Navbar::Link < Components::Base
  include Phlex::Rails::Helpers::LinkTo

  def initialize(label:, url:)
    @label = label
    @url = url
  end

  def view_template
    link_to(@label, @url, class: "hover:underline")
  end
end
