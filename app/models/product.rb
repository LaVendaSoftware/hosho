class Product < ApplicationRecord
  include PIDable

  belongs_to :category

  delegate :title, to: :category, allow_nil: true, prefix: true

  validates :title, presence: true
end
