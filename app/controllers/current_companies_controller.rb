class CurrentCompaniesController < ApplicationController
  def show
    cookies.signed.permanent[:current_company_pid] = params[:pid]

    redirect_back_or_to(root_path)
  end
end
