module Locations
  class UpdateLatLngJob < ApplicationJob
    queue_as :default

    def perform(location)
      location.update(lat: 1.23, lng: 4.56)
    end
  end
end
