class CompanyUser < ApplicationRecord
  self.table_name = "companies_users"

  belongs_to :company
  belongs_to :user
end
