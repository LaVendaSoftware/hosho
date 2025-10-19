class Company < ApplicationRecord
  include PIDable
  include Humanizable

  has_one :address, as: :addressable, dependent: :destroy
  has_many :company_users, dependent: :destroy
  has_many :users, through: :company_users
  has_many :categories, dependent: :destroy
  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :address

  validates :name, presence: true, uniqueness: true

  enum :industry, {other: 0, tourism: 1, commerce: 2, food: 3, automotive: 4}

  def disabled? = disabled_at.present?
  alias_method :disabled, :disabled?

  def humanized_industry
    human_enum_singular_name(:industry)
  end
end
