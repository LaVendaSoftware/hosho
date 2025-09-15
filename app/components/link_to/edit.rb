class Components::LinkTo::Edit < Components::Base
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::T

  def initialize(record)
    @record = record
  end

  def view_template
    link_to([:edit, @record], title: t(".tooltip")) { Components::Icon("pencil") }
  end
end
