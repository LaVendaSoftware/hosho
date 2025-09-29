class ApplicationController < ActionController::Base
  include Authentication
  include SetCurrentCompany

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_categories

  def current_categories
    @current_categories ||= CategoryRepo.new(Category).by_company(current_company).all
  end
end
