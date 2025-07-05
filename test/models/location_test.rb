require "test_helper"
require "minitest/mock"

class LocationTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  def setup
    @address = "1600 Amphitheatre Parkway, Mountain View, CA"
    @geocode_response = JSON.parse(File.read("test/fixtures/services/google/geocode.json"))
  end

  test "should change lat/lng after saving changes to address" do
    @location = Location.new(address: @address)

    assert_enqueued_with(job: Locations::UpdateLatLngJob) do
      @location.save
    end

    Google::Geocoding.stub :call, @geocode_response do
      perform_enqueued_jobs
    end

    @location.reload
    assert_equal @location.lat, 37.423
    assert_equal @location.lng, -122.084
  end
end
