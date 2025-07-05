class Location < ApplicationRecord
  has_many :outings

  after_save :update_lat_lng, if: :saved_change_to_address?

  private

  def update_lat_lng
    Locations::UpdateLatLngJob.perform_later self
  end
end
