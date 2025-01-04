class SessionsController < ApplicationController
  # skip_before_action :authenticate_user!
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Проверьте введенные данные'
      render :new
    end
  end

  def destroy
    # reset_session
    session[:user_id] = nil
    # cookies.delete(:_test_guru_session)
    # flash[:alert] = 'Вы вышли из аккаунта'
    redirect_to tests_path
  end
end
