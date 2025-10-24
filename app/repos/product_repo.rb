class ProductRepo < ApplicationRepo
  include Scopes::ByCompany

  def build(attributes = {})
    product = all.new(attributes)
    product.variants.build if product.variants.blank?

    product
  end

  def by_category(category_id)
    return none if category_id.blank?

    @collection = collection.where(category_id:)

    self
  end
end
