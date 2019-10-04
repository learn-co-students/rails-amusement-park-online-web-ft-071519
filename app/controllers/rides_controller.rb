class RidesController < ApplicationController

  def create
    new_ride = Ride.create(user_id: session[:user_id], attraction_id: ride_params[:attraction_id])
    new_ride.take_ride
    if new_ride.user.height >= new_ride.attraction.min_height && new_ride.user.tickets >= new_ride.attraction.tickets
      flash[:thanks] = "Thanks for riding the #{new_ride.attraction.name}!"
    elsif new_ride.user.height < new_ride.attraction.min_height && new_ride.user.tickets < new_ride.attraction.tickets
      flash[:detailed] = "You are not tall enough to ride the #{new_ride.attraction.name}. You do not have enough tickets to ride the #{new_ride.attraction.name}"
    elsif new_ride.user.tickets < new_ride.attraction.tickets
      flash[:insufficent_tickets] = "You do not have enough tickets to ride the #{new_ride.attraction.name}"
    elsif new_ride.user.height < new_ride.attraction.min_height
      flash[:short] = "You are not tall enough to ride the #{new_ride.attraction.name}"
    end
    redirect_to user_path(current_user)
  end






  private
  def ride_params
    params.require(:ride).permit(:attraction_id)
  end
end