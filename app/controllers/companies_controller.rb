class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]

  # GET /companies
  def index
    render Views::Companies::Index.new(companies: Company.all)
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
    render Views::Companies::New.new(company: Company.new)
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: "Company was successfully created."
    else
      render Views::Companies::New.new(company: @company), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Company was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy!
    redirect_to companies_path, notice: "Company was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.expect(company: [ :name, :nif, :industry ])
    end
end
