class Components::NestedField::Add < Components::Base
  def view_template
    div(class: "ml-auto") do
      button(type: "button", data_action: "nested-form#add", class: button_class) do
        Components::Icon("plus", height: 15, class: "mr-1")
        plain t(".label")
      end
    end
  end

  private

  def button_class
    [
      "whitespace-nowrap inline-flex items-center justify-center rounded-md font-medium transition-colors disabled:pointer-events-none disabled:opacity-50 focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring aria-disabled:pointer-events-none aria-disabled:opacity-50 aria-disabled:cursor-not-allowed px-4 py-2 h-9 text-sm bg-secondary text-secondary-foreground hover:bg-opacity-80"
    ]
  end
end
