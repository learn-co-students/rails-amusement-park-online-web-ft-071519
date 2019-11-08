class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    if !@current_user
      redirect_to '/'
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

end
