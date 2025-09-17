class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = repo.paginate(page: params[:page])
  end

  def show
  end

  def new
    @user = repo.build
  end

  def edit
  end

  def create
    @user = repo.build(user_params)

    if @user.save
      redirect_to(users_path, notice: t("alerts.create.success"))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to(users_path, notice: t("alerts.update.success"), status: :see_other)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def repo
    @repo ||= ApplicationRepo.new(User.not_developer)
  end

  def set_user
    @user = repo.find_by!(pid: params.expect(:id))
  end

  def user_params
    params.expect(user: [:name, :email_address, :password, :role, :company_ids])
  end
end
