require "test_helper"

class OutingTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  fixtures :outings

  setup do
    @outing = outings(:one)
  end

  test "should change lat/lng after saving changes to address" do
    @outing.address = "New"
    assert_enqueued_with(job: Outings::UpdateLatLngJob) do
      @outing.save
    end

    perform_enqueued_jobs

    @outing.reload
    assert_equal @outing.lat, 1.23
    assert_equal @outing.lng, 4.56
  end
end
