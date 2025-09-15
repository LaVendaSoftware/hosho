class Components::Form::Select < Components::Form::TextField
  def initialize(form, attribute, collection: [], **options)
    @form = form
    @attribute = attribute
    @collection = collection
    @options = options
  end

  private

  def input
    @form.select(@attribute, @collection, {include_blank: "Selecione..."}, {class: input_classes, **@options})
  end
end
