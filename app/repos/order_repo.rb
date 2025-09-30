class OrderRepo < ApplicationRepo
  include Scopes::ByCompany

  def build(attributes = {})
    order = all.new(attributes)
    order.items.build(quantity: 0.0, subtotal: 0.0) if order.items.blank?

    order
  end
end
