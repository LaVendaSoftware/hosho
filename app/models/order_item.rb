class OrderItem < ApplicationRecord
  include PIDable

  belongs_to :order
  belongs_to :product_variant

  delegate :product_title, to: :product_variant, allow_nil: true
  delegate :title, :price, to: :product_variant, allow_nil: true, prefix: true

  validates :quantity, presence: true, numericality: {greater_than: 0}
  validates :unit_price, presence: true, numericality: {greater_than: 0}

  def full_product_title
    [quantity, " x ", product_title, " - ", product_variant_title].join
  end
end
