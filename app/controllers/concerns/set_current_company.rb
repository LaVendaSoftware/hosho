module SetCurrentCompany
  extend ActiveSupport::Concern

  included do
    helper_method :current_company, :current_companies

    delegate :id, to: :current_company, allow_nil: true, prefix: true
  end

  private

  def current_company
    current_companies.find_by(pid: session_company_pid) || current_companies.first
  end

  def current_companies
    @current_companies ||= CompanyRepo.new(Company).by_user(Current.user).all
  end

  def session_company_pid = cookies.signed.permanent[:current_company_pid]
end
