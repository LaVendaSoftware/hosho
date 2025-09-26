class ProductVariant < ApplicationRecord
  include PIDable

  belongs_to :product

  delegate :title, to: :product, allow_nil: true, prefix: true

  validates :title, presence: true
  validates :price, presence: true

  def formatted_price
    price.to_s
  end
end
