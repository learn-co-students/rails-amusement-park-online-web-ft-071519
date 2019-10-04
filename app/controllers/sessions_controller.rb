class SessionsController < ApplicationController
  def new
    # nothing to do here!
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id
    redirect_to user_path(@user)

    # I want to figure out the authentication part of this eventually
  end


  def destroy
    session.delete :user_id
    redirect_to root_path
  end


end
