class ApplicationController < ActionController::Base
  include Authentication

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_company, :current_companies, :current_categories

  def current_company
    current_companies.find_by(pid: session_company_pid) || current_companies.first
  end

  def current_companies
    @current_companies ||= CompanyRepo.new(Company).by_user(Current.user).all
  end

  def current_categories
    @current_categories ||= CategoryRepo.new(Category).by_company(current_company).all
  end

  def session_company_pid = cookies.signed.permanent[:current_company_pid]
end
