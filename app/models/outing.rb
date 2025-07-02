class Outing < ApplicationRecord
  belongs_to :trip_day

  after_save :update_lat_lng, if: :saved_change_to_address?

  private

  def update_lat_lng
    Outings::UpdateLatLngJob.perform_later self
  end
end
