require "test_helper"

class TripDayTest < ActiveSupport::TestCase
  fixtures :trip_days

  setup do
    @trip_day = trip_days(:one)
  end

  test "should not save a trip day without a trip" do
    @trip_day.trip = nil
    assert_not @trip_day.save
    assert_includes @trip_day.errors.messages[:trip], "must exist"
  end

  test "should not save trip day without day" do
    @trip_day.day = nil
    assert_not @trip_day.save
    assert_includes @trip_day.errors.messages[:day], "can't be blank"
  end
end
