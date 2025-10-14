class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_customer, only: :new

  def index
    @orders = repo.paginate(page: params[:page])
  end

  def show
  end

  def new
    @order = repo.build(customer: @customer)
  end

  def edit
  end

  def create
    @order = repo.build(create_order_params)

    @order.items.map do |order_item|
      order_item.unit_price = order_item.product_variant_price
    end

    if @order.save
      redirect_to(@order, notice: t("alerts.create.success"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      redirect_to(@order, notice: t("alerts.update.success"), status: :see_other)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy!
    redirect_to(orders_path, notice: t("alerts.destroy.success"), status: :see_other)
  end

  private

  def repo
    @repo ||= OrderRepo.new(Order).by_company(current_company_id)
  end

  def set_order
    @order = repo.find_by!(pid: params.expect(:id))
  end

  def set_customer
    @customer =
      CustomerRepo.new(Customer)
        .by_company(current_company_id)
        .find_by(pid: params[:customer_id])
  end

  def create_order_params
    order_params.merge(user_id: Current.user_id, company_id: current_company_id)
  end

  def order_params
    params.expect(order: [
      :customer_id, :due_date,
      items_attributes: [[:id, :quantity, :product_variant_id]]
    ])
  end
end
