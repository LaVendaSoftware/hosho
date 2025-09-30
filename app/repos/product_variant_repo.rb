class ProductVariantRepo < ApplicationRepo
  def by_company(company_id)
    return none if company_id.blank?

    @collection =
      collection.joins(product: :category)
        .where(categories: {company_id:})

    self
  end
end
