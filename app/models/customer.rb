class Customer < ApplicationRecord
  include PIDable

  belongs_to :user

  has_one :address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :address

  delegate :name, :email_address, to: :user, allow_nil: true

  enum :document_type, {cpf: 0}

  validates :document, presence: true
  validates :phone, presence: true
  validates :phone, presence: true
end
