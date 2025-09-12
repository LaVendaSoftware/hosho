class Components::Page::IndexTitle < Components::Base
  def initialize(model:)
    @model = model
  end

  def view_template
    Components::Page::Title(title: tmp(@model))
  end
end
