require 'test_helper'

class UserCanAddFavoriteMountainsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = SnowAlert::Application
    stub_omniauth

    mountain = Mountain.create(name: "mountain", latitude: "39.523", longitude: "-104.325")
  end

  test "User adds and removes a favorite mountain from show page" do
    VCR.use_cassette('forecast_io_service#forecast2') do
      visit "/"
      click_link "Login"
      assert_equal edit_user_path(User.last), current_path

      assert_equal 0, User.last.favorites.count

      visit mountains_path
      click_link("mountain")
      click_link("Add to Favorites")

      assert_equal 1, User.last.favorites.count

      visit mountains_path
      click_link("mountain")
      click_link("Remove from Favorites")

      assert_equal 0, User.last.favorites.count
    end
  end

end
