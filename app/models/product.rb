class Product < ApplicationRecord
  include PIDable

  belongs_to :category

  has_many :variants, class_name: "ProductVariant", dependent: :restrict_with_error

  accepts_nested_attributes_for :variants, allow_destroy: true

  delegate :title, to: :category, allow_nil: true, prefix: true

  validates :title, presence: true
end
