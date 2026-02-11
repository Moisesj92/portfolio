require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "published posts require published_at" do
    post = Post.new(title: "Hello", body: "Body", status: :published, category: categories(:product))
    assert_not post.valid?
    assert_includes post.errors[:published_at], "can't be blank"
  end

  test "draft posts can omit published_at" do
    post = Post.new(title: "Draft", body: "Body", status: :draft, category: categories(:product))
    assert post.valid?
  end

  test "published scope excludes drafts" do
    assert_includes Post.published_live, posts(:published_post)
    assert_not_includes Post.published_live, posts(:draft_post)
  end
end
