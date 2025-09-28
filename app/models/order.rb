class Order < ApplicationRecord
  include PIDable
  include Humanizable

  belongs_to :company
  belongs_to :user

  enum :status, {pending: 0, ready: 1}

  def humanized_status = human_enum_singular_name(:status)
end
