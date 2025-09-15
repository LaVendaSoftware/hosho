class Components::Form::EmailField < Components::Form::TextField
  private

  def input
    @form.email_field(@attribute, class: input_classes, **@options)
  end
end
