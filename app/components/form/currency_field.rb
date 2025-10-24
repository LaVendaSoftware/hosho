class Components::Form::CurrencyField < Components::Form::TextField
  private

  def input
    @form.text_field(
      @attribute,
      placeholder: "0.00",
      data: {mask: "currency"},
      class: input_classes,
      **@options
    )
  end
end
