class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :require_login
  helper_method :current_user
  helper_method :is_admin
  def welcome

  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end

  def current_user
    User.find(session[:user_id])
  end

end
