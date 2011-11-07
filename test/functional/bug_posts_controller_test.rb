require 'test_helper'

class BugPostsControllerTest < ActionController::TestCase
  setup do
    @bug_post = bug_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bug_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bug_post" do
    assert_difference('BugPost.count') do
      post :create, bug_post: @bug_post.attributes
    end

    assert_redirected_to bug_post_path(assigns(:bug_post))
  end

  test "should show bug_post" do
    get :show, id: @bug_post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bug_post.to_param
    assert_response :success
  end

  test "should update bug_post" do
    put :update, id: @bug_post.to_param, bug_post: @bug_post.attributes
    assert_redirected_to bug_post_path(assigns(:bug_post))
  end

  test "should destroy bug_post" do
    assert_difference('BugPost.count', -1) do
      delete :destroy, id: @bug_post.to_param
    end

    assert_redirected_to bug_posts_path
  end
end
