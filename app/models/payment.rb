class Payment < ApplicationRecord
  include PIDable
  include Humanizable

  belongs_to :order

  enum :gateway_type, {stripe: 0}
  enum :status, {pending: 0, paid: 1, overdue: 2, refunded: 3, canceled: 4, expired: 5}

  validates :total, presence: true, numericality: {greater_than_or_equal_to: 0}

  def humanized_gateway_type = human_enum_singular_name(:gateway_type)
  def humanized_status = human_enum_singular_name(:status)
end
