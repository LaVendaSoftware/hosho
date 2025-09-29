class Category < ApplicationRecord
  include PIDable

  belongs_to :company

  has_many :products, dependent: :destroy

  delegate :name, to: :company, allow_nil: true, prefix: true

  validates :title, presence: true
end
