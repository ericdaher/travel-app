module Locations
  class UpdateLatLngJob < ApplicationJob
    queue_as :default

    def perform(location)
      result = Google::Geocoding.call(location.address)
      location.update(
        lat: result["results"].first["geometry"]["location"]["lat"].to_f.ceil(3),
        lng: result["results"].first["geometry"]["location"]["lng"].to_f.ceil(3)
        )
    end
  end
end
