class ProductsController < ApplicationController
  include Authorizations::Manager

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = repo.paginate(page: params[:page])
  end

  def show
  end

  def new
    @product = repo.build
  end

  def edit
  end

  def create
    @product = repo.build(product_params)

    if @product.save
      redirect_to(@product, notice: t("alerts.create.success"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to(@product, notice: t("alerts.update.success"), status: :see_other)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy!
    redirect_to(products_path, notice: t("alerts.destroy.success"), status: :see_other)
  end

  private

  def repo
    @repo ||= ProductRepo.new(Product).by_company(current_company)
  end

  def set_product
    @product = repo.find_by!(pid: params.expect(:id))
  end

  def product_params
    params.expect(product: [
      :category_id, :title, :description,
      variants_attributes: [[
        :id,
        :title,
        :price,
        :description,
        :_destroy
      ]]
    ])
  end
end
