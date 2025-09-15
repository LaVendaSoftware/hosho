class Components::LinkTo::Destroy < Components::Base
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::T

  def initialize(record)
    @record = record
  end

  def view_template
    # TODO: Fix destroy link
    # link_to(@record, method: :delete) { Components::Icon("trash") }
  end
end
