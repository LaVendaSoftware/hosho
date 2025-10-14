class Components::Form::DateField < Components::Form::TextField
  private

  def input
    @form.date_field(@attribute, class: input_classes, **@options)
  end
end
