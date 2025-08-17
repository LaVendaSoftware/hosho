
class Components::LinkTo::Back < Components::Base
  def initialize(url)
    @url = url
  end

  def view_template
    Link(href: @url, variant: :outline, class: "mr-2") { "Back" }
  end
end
