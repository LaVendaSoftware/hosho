class SessionsController < ApplicationController
  layout "authentication", only: %i[new create]

  allow_unauthenticated_access only: %i[new create]
  rate_limit to: 10, within: 3.minutes, only: :create,
    with: -> { redirect_to new_session_url, alert: t(".try_again_later") }

  def new
    @user = User.new
  end

  def create
    user = User.where(disabled_at: nil).authenticate_by(session_params)

    if user
      start_new_session_for(user)
      redirect_to(after_authentication_url)
    else
      redirect_to(new_session_path, alert: t(".error"))
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end

  private

  def session_params
    params.expect(user: [:email_address, :password])
  end
end
