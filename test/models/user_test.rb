require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email_address" do
    user = User.new(password: "123456", password_confirmation: "123456")
    assert_not user.save
  end

  test "should not save user with same email_address as other user" do
    User.create(email_address: "user@mail.com", password: "123456", password_confirmation: "123456")
    user = User.new(email_address: "user@mail.com", password: "123456", password_confirmation: "123456")
    assert_not user.save
  end

  test "email_address should match the email regex" do
    user = User.new(email_address: "user", password: "123456", password_confirmation: "123456")
    assert_not user.save
  end

  test "should not save user without password" do
    user = User.new(email_address: "user@mail.com")
    assert_not user.save
  end
end
