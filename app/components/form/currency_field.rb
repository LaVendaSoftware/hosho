class Components::Form::CurrencyField < Components::Form::TextField
  private

  def input
    # TODO: Add money mask
    @form.text_field(@attribute, class: input_classes, **@options)
  end
end
