require "test_helper"

class OutingTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  fixtures :outings

  setup do
    @outing = outings(:one)
  end

  test "should not save an outing without a trip_day" do
    @outing.trip_day = nil
    assert_not @outing.save
    assert_includes @outing.errors.messages[:trip_day], "must exist"
  end

  test "should not save an outing without a location" do
    @outing.location = nil
    assert_not @outing.save
    assert_includes @outing.errors.messages[:location], "must exist"
  end
end
