require 'test_helper'
class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @c = Category.create(name: "program")
    @category = Category.create(name: "books")
  end

  test "should show categ.. listing" do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@c), text: @c.name
  end
end