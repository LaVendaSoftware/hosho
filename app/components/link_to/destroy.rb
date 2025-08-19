class Components::LinkTo::Destroy < Components::Base
  def initialize(url)
    @url = url
  end

  def view_template
    Link(href: @url, variant: :destructive, class: "text-white") { "Destroy" }
  end
end
