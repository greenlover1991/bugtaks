require 'test_helper'

class BugCommentsControllerTest < ActionController::TestCase
  setup do
    @bug_comment = bug_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bug_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bug_comment" do
    assert_difference('BugComment.count') do
      post :create, bug_comment: @bug_comment.attributes
    end

    assert_redirected_to bug_comment_path(assigns(:bug_comment))
  end

  test "should show bug_comment" do
    get :show, id: @bug_comment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bug_comment.to_param
    assert_response :success
  end

  test "should update bug_comment" do
    put :update, id: @bug_comment.to_param, bug_comment: @bug_comment.attributes
    assert_redirected_to bug_comment_path(assigns(:bug_comment))
  end

  test "should destroy bug_comment" do
    assert_difference('BugComment.count', -1) do
      delete :destroy, id: @bug_comment.to_param
    end

    assert_redirected_to bug_comments_path
  end
end
