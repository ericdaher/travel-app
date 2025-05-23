require "test_helper"

class TripTest < ActiveSupport::TestCase
  fixtures :trips

  setup do
    @trip = trips(:one)
  end
  test "should not save a trip without an user" do
    @trip.user = nil
    assert_not @trip.save
    assert_includes @trip.errors.messages[:user], "must exist"
  end

  test "end_date should be after start_date" do
    @trip.end_date = @trip.start_date
    assert_not @trip.save
    assert_includes @trip.errors.messages[:end_date], "must be greater than #{@trip.start_date}"
  end
end
