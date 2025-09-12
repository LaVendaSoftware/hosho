class Components::Page::IndexTitle < Components::Base
  def initialize(model:)
    @model = model
  end

  def view_template
    Components::Page::Title(title: tmp(@model))

    div(class: "flex mb-4") do
      div(class: "flex-1") { Components::Page::Title(title: tmp(@model)) }
      Components::LinkTo::New("New #{tm(@model)}", new_company_path)
    end
  end
end
