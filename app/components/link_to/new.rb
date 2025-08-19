class Components::LinkTo::New < Components::Base
  def initialize(label, url)
    @label = label
    @url = url
  end

  def view_template
    Link(href: @url, variant: :primary) { @label }
  end
end
