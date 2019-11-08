class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
   #binding.pry
   if User.find_by_id(params[:user][:name])
    #binding.pry
     @user = User.find_by_id(params[:user][:name])
     if @user.authenticate(params[:password])     
       session[:user_id] = @user.id 
       redirect_to user_path(@user)
     else
        render :new
     end
   else
    render :new
   end
  end

  def destroy
    #binding.pry
   session.delete :user_id
   redirect_to root_path
  end




  private
  def session_params
    params.require(:user).permit(:name, :password)
  end
end