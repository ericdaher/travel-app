require "test_helper"

class LocationTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "should change lat/lng after saving changes to address" do
    @location = Location.new(address: "New")
    assert_enqueued_with(job: Locations::UpdateLatLngJob) do
      @location.save
    end

    perform_enqueued_jobs

    @location.reload
    assert_equal @location.lat, 1.23
    assert_equal @location.lng, 4.56
  end
end
