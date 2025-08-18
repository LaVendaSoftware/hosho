class Components::Form::EnumSelect < Components::Base
  def initialize(form, attribute)
    @form = form
    @attribute = attribute
    @resource = @form.object
    @klass = @resource.class
    @plural_name = @attribute.to_s.pluralize
  end

  def view_template
    Components::Form::Input(@form, :industry, collection: teo(@klass, @plural_name), include_blank: t("enum_select.prompt"))
  end
end
