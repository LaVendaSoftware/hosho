class Components::Form::ReadOnlyField < Components::Form::TextField
  private

  def input
    @form.text_field(@attribute, class: input_classes, **@options.merge(readonly: true))
  end

  def errors = nil
end
