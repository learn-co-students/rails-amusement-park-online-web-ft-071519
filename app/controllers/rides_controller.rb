class RidesController < ApplicationController
  def create
    attraction = Attraction.find(params[:attraction_id])
    ride = Ride.create(user: current_user, attraction: attraction)
    @message = ride.take_ride
    redirect_to current_user, notice: @message
  end
end
