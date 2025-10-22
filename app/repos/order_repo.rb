class OrderRepo < ApplicationRepo
  include Scopes::ByCompany

  def build(attributes = {})
    order = all.new(attributes)
    order.items.build if order.items.blank?

    order
  end
end
