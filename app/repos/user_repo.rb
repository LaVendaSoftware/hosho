class UserRepo < ApplicationRepo
  def by_user(user)
    return none if user.standard?

    @collection =
      collection.where.not(id: user.id)
        .where(role: ..User.roles[user.role])

    self
  end

  def by_company(company_id)
    return none if company_id.blank?

    @collection =
      collection.joins(:company_users)
        .where(company_users: {company_id:})

    self
  end
end
