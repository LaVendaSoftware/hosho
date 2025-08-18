class Components::Form::Input < Components::Base
  def initialize(form, attribute, **options)
    @form = form
    @attribute = attribute
    @options = options
  end

  def view_template
    @form.input(@attribute, **@options)
  end
end
