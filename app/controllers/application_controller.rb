class ApplicationController < ActionController::Base
  include Authentication
  include SetCurrentCompany

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_categories, :current_product_variants, :current_customers

  def current_categories
    @current_categories ||= CategoryRepo.new(Category).by_company(current_company_id).all
  end

  def current_product_variants
    @current_product_variants ||= ProductVariantRepo.new(ProductVariant).by_company(current_company_id).all
  end

  def current_customers
    @current_customers ||= CustomerRepo.new(Customer).by_company(current_company_id).all
  end
end
