module Outings
  class UpdateLatLngJob < ApplicationJob
    queue_as :default

    def perform(outing)
      outing.update(lat: 1.23, lng: 4.56)
    end
  end
end
