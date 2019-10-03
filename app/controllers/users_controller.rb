class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      #binding.pry
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        #binding.pry
        redirect_to @user
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