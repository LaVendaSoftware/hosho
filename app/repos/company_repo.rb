class CompanyRepo < ApplicationRepo
  def build(attributes = {})
    company = all.new(attributes)
    company.build_address if company.address.blank?

    company
  end

  def by_user(user)
    return none if user.blank?
    return self if user.has_permission?(:admin)

    @collection =
      collection.includes(:company_users)
        .where(company_users: {user_id: user.id})

    self
  end
end
