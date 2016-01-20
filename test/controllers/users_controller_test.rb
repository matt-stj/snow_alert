require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    user = User.create!(id: 1)
    mountain = Mountain.create!(id: 1)
    user.favorites.create(mountain_id: 1)
    session[:user_id] = 1
  end

  test "should get show page" do
    get :show, id: 1
    assert_response :success
  end

end
