class Components::Companies::ReadOnlyField < Components::Form::ReadOnlyField
  def initialize(form, attribute = :company_id, company:, **options)
    @form = form
    @attribute = attribute
    @options = options
    @company = company
  end

  private

  def input
    @form.text_field(@attribute, value: @company.name, class: input_classes, **@options.merge(readonly: true))
  end
end
