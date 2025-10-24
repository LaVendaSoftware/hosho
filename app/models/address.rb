class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  enum :source, {unknown: 0, via_cep: 1}

  validates :country, inclusion: {in: Addresses::Countries.allowed_dialing_codes}
end
