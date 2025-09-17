class User < ApplicationRecord
  include PIDable

  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :company_users, dependent: :destroy
  has_many :companies, through: :company_users

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  enum :role, {standard: 0, seller: 1, manager: 2, admin: 99, developer: 999}

  def disabled? = disabled_at.present?
  alias_method :disabled, :disabled?
end
