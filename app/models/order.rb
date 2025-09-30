class Order < ApplicationRecord
  include PIDable
  include Humanizable

  belongs_to :customer
  belongs_to :company
  belongs_to :user, optional: true

  has_many :items, class_name: "OrderItem", dependent: :restrict_with_error
  has_many :product_variants, through: :items

  delegate :name, :email_address, to: :customer, allow_nil: true, prefix: true

  accepts_nested_attributes_for :items, allow_destroy: true

  enum :status, {pending: 0, ready: 1}

  validates :items, length: {minimum: 1}

  def humanized_status = human_enum_singular_name(:status)

  def product_titles
    items.map { |item| item.full_product_title }
  end
end
