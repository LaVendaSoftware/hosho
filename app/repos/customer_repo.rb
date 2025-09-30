class CustomerRepo < ApplicationRepo
  def build(attributes = {})
    customer = all.new(attributes)
    customer.build_user if customer.user.blank?
    customer.build_address if customer.address.blank?

    customer
  end

  def by_user(user)
    return none if user.blank?
    return self if user.has_permission?(:admin)

    @collection =
      collection.includes(:customer_users)
        .where(customer_users: {user_id: user.id})

    self
  end

  def by_company(company_id)
    return none if company_id.blank?

    @collection =
      collection.joins(user: :company_users)
        .where(company_users: {company_id:})

    self
  end
end
