require "test_helper"

class UserTest < ActiveSupport::TestCase
  fixtures :users, :trips

  setup do
    @user = users(:one)
  end
  test "should not save user without email_address and should add error" do
    @user.email_address = nil
    assert_not @user.save
    assert_includes @user.errors.messages[:email_address], "can't be blank"
  end

  test "should not save user with same email_address as other user and should add error" do
    user = User.new(email_address: @user.email_address)
    assert_not user.save
    assert_includes user.errors.messages[:email_address], "has already been taken"
  end

  test "email_address should match the email regex and should add error" do
    @user.email_address = "user_mail"
    assert_not @user.save
    assert_includes @user.errors.messages[:email_address], "is invalid"
  end

  test "should not save user without password and should add error" do
    @user.password = nil
    assert_not @user.save
    assert_includes @user.errors.messages[:password], "can't be blank"
  end

  test "has many trips" do
    assert_equal @user.trips.count, 2
    assert_includes @user.trips, trips(:one)
    assert_includes @user.trips, trips(:two)
  end
end
