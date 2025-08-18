class Components::Form::EnumSelect < Components::Base
  include Components::Form::BaseField
  include Phlex::Rails::Helpers::T

  def initialize(form, attribute)
    @form = form
    @attribute = attribute
    @resource = @form.object
    @klass = @resource.class
    @plural_name = @attribute.to_s.pluralize
  end

  def view_template
    div do
      FormFieldLabel(for: field_id) do
        ta(@resource.class, @attribute)
      end

      @form.select :industry,
        teo(@klass, @plural_name),
        {include_blank: t("enum_select.prompt")},
        {class: select_classes}
    end
  end

  private

  def select_classes
    [
      "flex h-9 w-full rounded-md border bg-background px-3 py-1 text-sm shadow-sm ",
      "transition-colors file:border-0 file:bg-transparent file:text-sm file:font-medium ",
      "focus-visible:outline-none focus-visible:ring-1 disabled:cursor-not-allowed ",
      "disabled:opacity-50 border-border focus-visible:ring-ring placeholder:text-muted-foreground"
    ].join
  end
end
