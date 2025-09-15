class Components::Form::PasswordField < Components::Form::TextField
  private

  def input
    @form.password_field(@attribute, class: input_classes, **@options)
  end
end
