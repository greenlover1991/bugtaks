require 'test_helper'

class TaskLedgersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
