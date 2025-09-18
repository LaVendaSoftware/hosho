class User < ApplicationRecord
  include PIDable
  include Humanizable

  ROLE_PERMISSIONS = {
    developer: ["developer"],
    admin: ["admin", "developer"],
    manager: ["manager", "admin", "developer"],
    seller: ["seller", "manager", "admin", "developer"],
    standard: ["standard", "seller", "manager", "admin", "developer"]
  }

  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :company_users, dependent: :destroy
  has_many :companies, through: :company_users

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  enum :role, {standard: 0, seller: 1, manager: 2, admin: 99, developer: 999}

  validates :name, presence: true
  validates :email_address, presence: true
  validates :role, inclusion: {in: User.roles.keys}

  validate :must_have_company_if_staff

  def humanized_role
    human_enum_singular_name(:role)
  end

  def has_permission?(role_name)
    role.in?(ROLE_PERMISSIONS[role_name.to_s.to_sym])
  end

  def disabled? = disabled_at.present?
  alias_method :disabled, :disabled?

  private

  def must_have_company_if_staff
    return unless manager? || seller?

    errors.add(:company_ids, :blank) if companies.blank?
  end
end
