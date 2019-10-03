class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      #binding.pry
      @user = User.create(user_params)
      if @user.save
        redirect_to user_path(@user)
        session[:user_id] = @user.id
      else 
        render :new
      end
    end

    def show
      @user = User.find_by_id(params[:id])
    end


    private
    def user_params
        params.require(
            :user).permit(
            :name, :password, :password_confirmation, :height, :happiness, :nausea, :tickets)
    end

end