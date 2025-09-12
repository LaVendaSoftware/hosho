class Components::Form::EmailField < Components::Form::TextField
  def view_template
    div(class: "grid gap-3") do
      span { @form.label(@attribute, class: label_classes) }
      span { @form.email_field(@attribute, class: input_classes, **@options) }
    end
  end
end
