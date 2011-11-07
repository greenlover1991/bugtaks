require 'test_helper'

class BugCategoriesControllerTest < ActionController::TestCase
  setup do
    @bug_category = bug_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bug_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bug_category" do
    assert_difference('BugCategory.count') do
      post :create, bug_category: @bug_category.attributes
    end

    assert_redirected_to bug_category_path(assigns(:bug_category))
  end

  test "should show bug_category" do
    get :show, id: @bug_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bug_category.to_param
    assert_response :success
  end

  test "should update bug_category" do
    put :update, id: @bug_category.to_param, bug_category: @bug_category.attributes
    assert_redirected_to bug_category_path(assigns(:bug_category))
  end

  test "should destroy bug_category" do
    assert_difference('BugCategory.count', -1) do
      delete :destroy, id: @bug_category.to_param
    end

    assert_redirected_to bug_categories_path
  end
end
