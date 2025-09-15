class Components::Form::EnumSelect < Components::Base
  def initialize(form, attribute, collection: [], **options)
    @form = form
    @attribute = attribute
    @collection = collection
    @options = options
  end

  def view_template
    Components::Form::Select(@form, @attribute, collection:, **@options)
  end

  private

  def collection
    return @collection if @collection.present?

    h.teo(@form.object.class, @attribute.to_s.pluralize)
  end
end
