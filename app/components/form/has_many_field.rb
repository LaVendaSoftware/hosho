class Components::Form::HasManyField < Components::Base
  def initialize(form, attribute, collection: [], **options)
    @form = form
    @attribute = attribute
    @collection = collection
    @options = options
  end

  def view_template
    Components::Form::Select(@form, @attribute, collection: @collection, **@options)
  end
end
