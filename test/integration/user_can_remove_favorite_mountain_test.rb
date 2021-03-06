require 'test_helper'

class UserCanRemoveFavoriteMountainTest < ActionDispatch::IntegrationTest
  attr_reader :mountain

  include Capybara::DSL

  def setup
    Capybara.app = SnowAlert::Application
    stub_omniauth

    @mountain = Mountain.create(name: "mountain", latitude: "39.523", longitude: "-104.325")
  end

  test "User adds favorite resorts" do
    VCR.use_cassette('forecast_io_service#forecast') do
      visit "/"
      click_link "Login"
      assert_equal edit_user_path(User.last), current_path

      assert_equal 0, User.last.favorites.count

      User.last.favorites.create(mountain_id: mountain.id)

      assert_equal 1, User.last.favorites.count

      visit mountains_path
      click_link("mountain")

      click_link("Remove from Favorites")

      assert_equal 0, User.last.favorites.count
    end
  end

end
