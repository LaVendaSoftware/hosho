class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]

  def index
    @customers = repo.paginate(page: params[:page])
  end

  def show
  end

  def new
    @customer = repo.build
  end

  def edit
  end

  def create
    @customer = repo.build(customer_params)

    if @customer.save
      redirect_to(@customer, notice: t("alerts.create.success"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to(@customer, notice: t("alerts.update.success"), status: :see_other)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def repo
    @repo ||= CustomerRepo.new(Customer)
  end

  def set_customer
    @customer = repo.find_by!(pid: params.expect(:id))
  end

  def customer_params
    params.expect(customer: [
      :document,
      :country_code,
      :phone,
      user_attributes: [
        :id,
        :name,
        :email_address,
        :password
      ],
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
