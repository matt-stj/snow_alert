require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should get new action" do
    get :new
    assert_response :success
  end


end
