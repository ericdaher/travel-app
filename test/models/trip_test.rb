require "test_helper"

class TripTest < ActiveSupport::TestCase
  fixtures :trips, :users

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

  test "should create a TripDay for each day between start_date and end_date" do
    @trip = Trip.create(user: users(:one), start_date: Time.now, end_date: 1.week.from_now)
    assert_equal @trip.days.count, 7
    (@trip.start_date.to_date...@trip.end_date.to_date).each_with_index do |day, index|
      assert_equal @trip.days[index].day, day
    end
  end
end
