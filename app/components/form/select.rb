class Components::Form::Select < Components::Form::TextField
  def initialize(form, attribute, collection: [], **options)
    @form = form
    @attribute = attribute
    @collection = collection
    @options = options
  end

  private

  def input
    @form.select(@attribute, @collection, select_options, {class: input_classes, **@options})
  end

  def select_options
    {include_blank: @options.delete(:include_blank).presence || "Selecione..."}
  end
end
