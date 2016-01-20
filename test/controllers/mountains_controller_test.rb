require 'test_helper'

class MountainsControllerTest < ActionController::TestCase

  test "should get search page" do
    get :search
    assert_response :success
    assert_not_nil assigns(:mountains)
  end

  test "should get index page" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mountains)
  end

end
