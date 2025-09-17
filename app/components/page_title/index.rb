class Components::PageTitle::Index < Components::Base
  def initialize(model:, link: nil, icon: nil)
    @model = model
    @link = link
    @icon = icon
  end

  def view_template
    Components::PageTitle::Base(h.tmp(@model), link: @link, icon: @icon)
  end
end
