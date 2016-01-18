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

  test "truncate coordiantes works as expected" do
    skip
    coordinate = "39.5679"
    assert_equal "39.5679", truncate_coordinate(coordinate)
  end
end
