require "test_helper"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassetes"
  config.hook_into :webmock
end

class Google::GeocodingTest < ActiveSupport::TestCase
  test "should make requests correctly" do
    address = "1600 Amphitheatre Parkway, Mountain View, CA"

    VCR.use_cassette("google_geocode") do
      response = Google::Geocoding.call(address)
      assert_equal JSON.parse(response), JSON.parse(File.read("test/fixtures/services/google/geocode.json"))
    end
  end
end
