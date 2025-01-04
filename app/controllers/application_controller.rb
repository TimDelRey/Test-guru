class ApplicationController < ActionController::Base
  before_action :current_user
  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    return if current_user
      redirect_to welcome_path, alert: 'Желаете зарегистрироваться или авторизоваться?' # алерт тут доп параметр редиректа
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    @current_user.present?
  end

  def auth_check
    unless logged_in?
      cookies[:redirect_after_login] = request.fullpath
      redirect_to login_path
      flash[:alert] = 'У вас недостаточно прав'
    end
  end
end
