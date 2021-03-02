class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = @user.reset_session_token!
  end

  def require_not_login
    if current_user
      redirect_to cats_url
    end
  end

  def logged_in?
    redirect_to cats_url unless !!current_user

  end

  

end
