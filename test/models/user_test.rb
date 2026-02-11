require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "normalizes email" do
    user = User.new(email: "Admin@Example.com", password: "password123", password_confirmation: "password123")
    user.validate
    assert_equal "admin@example.com", user.email
  end
end
