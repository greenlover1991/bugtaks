require 'test_helper'

class BugListsControllerTest < ActionController::TestCase
  setup do
    @bug_list = bug_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bug_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bug_list" do
    assert_difference('BugList.count') do
      post :create, bug_list: @bug_list.attributes
    end

    assert_redirected_to bug_list_path(assigns(:bug_list))
  end

  test "should show bug_list" do
    get :show, id: @bug_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bug_list.to_param
    assert_response :success
  end

  test "should update bug_list" do
    put :update, id: @bug_list.to_param, bug_list: @bug_list.attributes
    assert_redirected_to bug_list_path(assigns(:bug_list))
  end

  test "should destroy bug_list" do
    assert_difference('BugList.count', -1) do
      delete :destroy, id: @bug_list.to_param
    end

    assert_redirected_to bug_lists_path
  end
end
