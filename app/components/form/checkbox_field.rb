class Components::Form::CheckboxField < Components::Base
  include Components::Form::BaseField

  def initialize(resource, attribute)
    @resource = resource
    @attribute = attribute
  end

  def view_template
    div(class: "flex items-center space-x-3 mt-4") do
      Checkbox(id: field_id, name: field_name, checked: @resource.send(@attribute))

      FormFieldLabel(for: field_id) do
        ta(@resource.class, @attribute)
      end
    end
  end
end
