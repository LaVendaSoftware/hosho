class CategoriesController < ApplicationController
  include Authorizations::Manager

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = repo.paginate(page: params[:page])
  end

  def show
  end

  def new
    @category = repo.build
  end

  def edit
  end

  def create
    @category = repo.build(category_params)

    if @category.save
      redirect_to(@category, notice: t("alerts.create.success"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to(@category, notice: t("alerts.update.success"), status: :see_other)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy!
    redirect_to(categories_path, notice: t("alerts.destroy.success"), status: :see_other)
  end

  private

  def repo
    @repo ||= CategoryRepo.new(Category).by_company(current_company)
  end

  def set_category
    @category = repo.find_by!(pid: params.expect(:id))
  end

  def category_params
    params.expect(category: [:title])
  end
end
