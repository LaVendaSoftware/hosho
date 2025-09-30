class ConnectedAccount < ApplicationRecord
  include PIDable

  belongs_to :user

  validates :external_id, presence: true
end
