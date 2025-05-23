class TripsController < ApplicationController
  def index
    @trips = Current.user.trips
  end

  def new
    @trip = Current.user.trips.build
  end

  def create
    @trip = Current.user.trips.build(trip_params)
    if @trip.save
      redirect_to trips_path, notice: "Trip created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def trip_params
    params.expect(trip: [ :name, :description, :destination, :start_date, :end_date ])
  end
end
