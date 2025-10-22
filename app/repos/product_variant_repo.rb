class ProductVariantRepo < ApplicationRepo
  delegate :find_or_initialize_by, to: :collection

  def by_company(company_id)
    return none if company_id.blank?

    @collection =
      collection.joins(product: :category)
        .where(categories: {company_id:})

    self
  end
end
