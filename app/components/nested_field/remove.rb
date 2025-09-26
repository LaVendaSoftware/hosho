class Components::NestedField::Remove < Components::Base
  def view_template
    div(class: "flex justify-end") do
      button(type: "button", data_action: "nested-form#remove", class: button_class) do
        Components::Icon("x", height: 15, class: "mr-1")
        plain t(".label")
      end
    end
  end

  private

  def button_class
    [
      "whitespace-nowrap inline-flex items-center justify-center rounded-md font-medium transition-colors disabled:pointer-events-none disabled:opacity-50 focus-visible:outline-none focus-visible:ring-1 aria-disabled:pointer-events-none aria-disabled:opacity-50 aria-disabled:cursor-not-allowed px-4 py-2 h-9 text-sm bg-destructive text-white shadow-sm [a&]:hover:bg-destructive/90 focus-visible:ring-destructive/20 dark:focus-visible:ring-destructive/40 dark:bg-destructive/60"
    ]
  end
end
