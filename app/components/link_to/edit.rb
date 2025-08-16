class Components::LinkTo::Edit < Components::Base
  def initialize(url)
    @url = url
  end

  def view_template
    Link(href: @url, variant: :outline) { "Edit" }
  end
end
