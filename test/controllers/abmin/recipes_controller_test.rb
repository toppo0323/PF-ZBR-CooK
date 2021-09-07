require 'test_helper'

class Abmin::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get abmin_recipes_index_url
    assert_response :success
  end

  test "should get show" do
    get abmin_recipes_show_url
    assert_response :success
  end

  test "should get edit" do
    get abmin_recipes_edit_url
    assert_response :success
  end

  test "should get update" do
    get abmin_recipes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get abmin_recipes_destroy_url
    assert_response :success
  end

end
