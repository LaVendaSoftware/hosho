class Company < ApplicationRecord
  include PIDable

  validates :name, presence: true, uniqueness: true

  enum :industry, {other: 0, tourism: 1, commerce: 2, food: 3, automotive: 4}

  def disabled? = disabled_at.present?
end
