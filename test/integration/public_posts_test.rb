require "test_helper"

class PublicPostsTest < ActionDispatch::IntegrationTest
  test "shows only published posts" do
    get root_path
    assert_response :success
    assert_select "h2", text: posts(:published_post).title
    assert_select "h2", text: posts(:draft_post).title, count: 0
  end
end
