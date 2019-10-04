class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
        @current_user = current_user
    end

    def show
        @attraction = Attraction.find_by_id(params[:id])
        @new_ride = Ride.new
    end

    def new
        @attraction = Attraction.new
    end

    def create
      attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(attraction)
    end

private
  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end