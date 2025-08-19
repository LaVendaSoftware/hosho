class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  # GET /companies
  def index
    render Views::Companies::Index.new(companies: Company.all)
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
    company = Company.new
    company.build_address

    render Views::Companies::New.new(company:)
  end

  # GET /companies/1/edit
  def edit
    render Views::Companies::Edit.new(company: @company)
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: t(".success")
    else
      render Views::Companies::New.new(company: @company), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: t(".success"), status: :see_other
    else
      render Views::Companies::Edit.new(company: @company), status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy!
    redirect_to companies_path, notice: t(".success"), status: :see_other
  end

  private

  def set_company
    @company = Company.find(params.expect(:id))
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
