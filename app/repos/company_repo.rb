class CompanyRepo < ApplicationRepo
  def build(attributes = {})
    company = all.new(attributes)
    company.build_address if company.address.blank?

    company
  end
end
