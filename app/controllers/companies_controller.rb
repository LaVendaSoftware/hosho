class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = repo.paginate(page: params[:page])
  end

  def show
  end

  def new
    @company = repo.build
  end

  def edit
  end

  def create
    @company = repo.build(company_params)

    if @company.save
      redirect_to(@company, notice: t("alerts.create.success"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      redirect_to(@company, notice: t("alerts.update.success"), status: :see_other)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy!
    redirect_to(companies_path, notice: t("alerts.destroy.success"), status: :see_other)
  end

  private

  def repo
    @repo ||= CompanyRepo.new(Company)
  end

  def set_company
    @company = repo.find_by!(pid: params.expect(:id))
  end

  def company_params
    params
      .expect(company: [
        :name, :nif, :industry,
        address_attributes: [
          :id,
          :zip_code,
          :street_name,
          :building_number,
          :district,
          :city,
          :state,
          :complement,
          :reference
        ]
      ])
  end
end
