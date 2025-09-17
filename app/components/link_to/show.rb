class Components::LinkTo::Show < Components::Base
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::T

  def initialize(record)
    @record = record
  end

  def view_template
    link_to(@record) { Components::Icon("eye") }
  end
end
