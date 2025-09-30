class OrderItem < ApplicationRecord
  include PIDable

  belongs_to :order
  belongs_to :product_variant

  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :unit_price, presence: true, numericality: {greater_than: 0}
end
