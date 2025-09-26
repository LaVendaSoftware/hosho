class ProductVariant < ApplicationRecord
  include PIDable

  belongs_to :product

  validates :title, presence: true
  validates :price, presence: true
end
