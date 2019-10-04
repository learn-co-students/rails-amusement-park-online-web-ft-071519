class RidesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    ride = user.rides.create(attraction_id: params[:attraction_id])
    flash[:message] = ride.take_ride
    redirect_to user_path(user)
  end
end
