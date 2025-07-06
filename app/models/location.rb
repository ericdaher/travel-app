class Location < ApplicationRecord
  has_many :outings

  after_save :update_lat_lng, if: :saved_change_to_address?
  after_save :broadcast_rating_change, if: :saved_change_to_rating?

  private

  def update_lat_lng
    Locations::UpdateLatLngJob.perform_later self
  end

  def broadcast_rating_change
    ActionCable.server.broadcast("locations", rating)
  end
end
