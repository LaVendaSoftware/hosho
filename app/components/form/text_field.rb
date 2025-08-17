class Components::Form::TextField < Components::Base
  def initialize(resource, attribute)
    @resource = resource
    @attribute = attribute
  end

  def view_template
    FormField do
      FormFieldLabel(for: field_id) do
        ta(@resource.class, @attribute)
      end

      Input(id: field_id, name: field_name, value: @resource.send(@attribute))
      FormFieldError { @resource.errors.full_messages_for(@attribute).to_sentence }
    end
  end

  private

  def field_id
    "#{@resource.class}_#{@attribute}".underscore
  end

  def field_name
    "#{@resource.class}[#{@attribute}]".underscore
  end
end
