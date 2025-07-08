class LocationsController < ApplicationController
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

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to @location
    else
      render "show", status: :unprocessable_entity
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to root_path
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
