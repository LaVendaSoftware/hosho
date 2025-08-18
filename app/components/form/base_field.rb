module Components::Form::BaseField
  private

  def field_id
    "#{@resource.class}_#{@attribute}".underscore
  end

  def field_name
    "#{@resource.class}[#{@attribute}]".underscore
  end
end
