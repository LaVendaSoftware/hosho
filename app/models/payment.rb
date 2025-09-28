class Payment < ApplicationRecord
  include PIDable
  include Humanizable

  belongs_to :order

  has_many :payment_attempts, dependent: :restrict_with_error

  enum :gateway_type, {stripe: 0}
  enum :status, {processing: 0, pending: 1, paid: 2, refused: 3, canceled: 4, refunded: 5}

  validates :total, presence: true, numericality: {greater_than_or_equal_to: 0}

  def humanized_gateway_type = human_enum_singular_name(:gateway_type)
  def humanized_status = human_enum_singular_name(:status)
end
