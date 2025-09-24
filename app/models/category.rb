class Category < ApplicationRecord
  include PIDable

  belongs_to :company

  delegate :name, to: :company, allow_nil: true, prefix: true

  validates :title, presence: true
end
