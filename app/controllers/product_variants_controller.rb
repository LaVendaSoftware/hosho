class ProductVariantsController < ApplicationController
  before_action :set_product_variant, only: [:show, :edit, :update, :destroy]

  def index
    @product_variants = repo.paginate(page: params[:page])
  end

  def show
  end

  def new
    @product_variant = repo.build
  end

  def edit
  end

  def create
    @product_variant = repo.build(product_variant_params)

    if @product_variant.save
      redirect_to(@product_variant, notice: t("alerts.create.success"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product_variant.update(product_variant_params)
      redirect_to(@product_variant, notice: t("alerts.update.success"), status: :see_other)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product_variant.destroy!
    redirect_to(product_variants_path, notice: t("alerts.destroy.success"), status: :see_other)
  end

  private

  def repo
    @repo ||= ApplicationRepo.new(ProductVariant)
  end

  def set_product_variant
    @product_variant = repo.find_by!(pid: params.expect(:id))
  end

  def product_variant_params
    params.expect(product_variant: [:product_id, :title, :description, :price])
  end
end
