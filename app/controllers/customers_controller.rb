class CustomersController < ApplicationController
  include Authorizations::Seller

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
    @customer = repo.build(new_customer_params)

    if @customer.save
      redirect_after_save(notice: t("alerts.update.success"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_after_save(notice: t("alerts.update.success"))
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def redirect_after_save(notice:)
    if params[:commit_and_new_order]
      redirect_to(new_order_path(customer_id: @customer.pid), notice:)
    else
      redirect_to(@customer, notice:, status: :see_other)
    end
  end

  def repo
    @repo ||= CustomerRepo.new(Customer)
  end

  def set_customer
    @customer = repo.find_by!(pid: params.expect(:id))
  end

  def new_customer_params
    customer_params.merge(user_attributes: {
      **customer_params[:user_attributes],
      company_ids: [current_company_id]
    })
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
        :source,
        :country,
        :raw_address,
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
