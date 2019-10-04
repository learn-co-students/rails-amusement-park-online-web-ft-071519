class AttractionsController < ApplicationController
  before_action :require_login

  def index
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])

  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path
  end

  def destroy
    @attraction = Attraction.find(params[:id])

  end

  def edit
    @attraction = Attraction.find(params[:id])
    redirect_to attraction_path unless current_user.is_admin?
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
