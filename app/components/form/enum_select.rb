class Components::Form::EnumSelect < Components::Base
  def initialize(form, attribute, collection: [], except: [], **options)
    @form = form
    @attribute = attribute
    @collection = collection
    @except = except
    @options = options
  end

  def view_template
    Components::Form::Select(@form, @attribute, collection:, **@options)
  end

  private

  def collection
    return @collection if @collection.present?

    h.teo(@form.object.class, @attribute.to_s.pluralize, except: @except)
  end
end
