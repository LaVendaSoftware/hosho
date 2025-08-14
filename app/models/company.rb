class Company < ApplicationRecord
  validates :name, presence: true

  enum :industry, { tourism: 0, commerce: 1, food: 2, automotive: 3 }

  def disabled? = disabled_at.present?
end
