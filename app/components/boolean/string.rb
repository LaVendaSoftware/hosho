class Components::Boolean::String < Components::Base
  def initialize(value)
    @value = value
  end

  def view_template
    plain(@value ? "Yes" : "No")
  end
end
