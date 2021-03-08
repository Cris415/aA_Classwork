class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def sign_in!(user)
    token = user.reset_session_token!
    session[:session_token] = token
  end

  def sign_out!
    user = current_user()
    user.reset_session_token!
    session[:session_token] = nil
  end

  def signed_in?
    !!current_user
  end

  def require_signed_in
    unless signed_in?
      redirect_to new_session_url
    end
  end

end
