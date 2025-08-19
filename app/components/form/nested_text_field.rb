class Components::Form::NestedTextField < Components::Form::TextField
  def initialize(resource, nested, attribute)
    @resource = resource
    @nested = nested
    @attribute = attribute
  end

  private

  def field_id
    "#{@resource.class}_#{@nested}_#{@attribute}".underscore
  end

  def field_name
    "#{@resource.class}[#{@nested}][#{@attribute}]".underscore
  end

  def field_value
    @resource.send(@nested).send(@attribute)
  end
end
