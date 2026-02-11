require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "requires name" do
    category = Category.new(name: "")
    assert_not category.valid?
  end
end
