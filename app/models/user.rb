class User < ApplicationRecord
  include PIDable
  include Humanizable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  normalizes :email, with: ->(e) { e.strip.downcase }

  enum :role, {standard: 0, admin: 99, developer: 999}

  validates :name, presence: true
  validates :role, inclusion: {in: User.roles.keys}

  def disabled? = disabled_at.present?
  alias_method :disabled, :disabled?

  def humanized_role
    human_enum_singular_name(:role)
  end
end
