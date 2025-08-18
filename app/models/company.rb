class Company < ApplicationRecord
  include PIDable

  has_one :address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :address

  validates :name, presence: true, uniqueness: true

  enum :industry, {other: 0, tourism: 1, commerce: 2, food: 3, automotive: 4}

  def disabled? = disabled_at.present?
  alias_method :disabled, :disabled?
end
