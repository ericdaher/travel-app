class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @location = @location.from_user(Current.user) if params[:filter] == "mine"
  end

  def show
    @location = Location.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to locations_path, alert: "Location not found" if @location.nil?
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location
    else
      render "new", status: :unprocessable_entity
    end
  end

  def increment_rating
    @location = Location.find(params[:id])
    if @location.update(rating: @location.rating + 1)
      redirect_to @location
    else
      render "show", status: :unprocessable_entity
    end
  end

  def decrement_rating
    @location = Location.find(params[:id])
    if @location.update(rating: @location.rating - 1)
      redirect_to @location
    else
      render "show", status: :unprocessable_entity
    end
  end

  private

  def location_params
    params.expect(location: [ :name, :description, :address ])
  end
end
