require "test_helper"

class AdminAccessTest < ActionDispatch::IntegrationTest
  test "redirects unauthenticated users" do
    get admin_posts_path
    assert_redirected_to login_path
  end

  test "allows admin users" do
    log_in_as(users(:admin))
    get admin_posts_path
    assert_response :success
  end
end
