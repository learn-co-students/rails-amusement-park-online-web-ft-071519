class RidesController < ApplicationController

  def create
    new_ride = Ride.create(user_id: session[:user_id], attraction_id: ride_params[:attraction_id])
    flash[:message] = new_ride.take_ride
    redirect_to user_path(current_user)
  end






  private
  def ride_params
    params.require(:ride).permit(:attraction_id)
  end
end