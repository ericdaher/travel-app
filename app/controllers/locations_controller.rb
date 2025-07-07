class LocationsController < ApplicationController
  def index
    puts Current.user
    if Current.user.present?
      @locations = Location.order(rating: :desc)
      @locations = @location.from_user(Current.user) if params[:filter] == "mine"
    else
      @locations = Rails.cache.fetch("top_locations") do
        Location.top_3
      end
    end
  end

  def show
    location = Location.find(params[:id])
    @location_presenter = LocationPresenter.new(location: location)
  rescue ActiveRecord::RecordNotFound
    redirect_to locations_path, alert: "Local não encontrado" if location.nil?
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
