require 'test_helper'

class UserCanBrowseAndSearchMountainsTest < ActionDispatch::IntegrationTest
  def setup
    states = ["CO", "CA", "WY"]
    3.times do |i|
      Mountain.create(name: "Mountain - #{i}", latitude: "39.523", longitude: "-104.325", state: states[i])
    end
  end

  test "user can browse mountains by state" do
    VCR.use_cassette('forecast_io_service#forecast') do
      mountain = Mountain.first
      visit mountains_path

      within(".browse") do
        assert page.has_content?("CO")
        assert page.has_content?("Mountain - 0")
        assert page.has_content?("CA")
        assert page.has_content?("Mountain - 1")
        assert page.has_content?("WY")
        assert page.has_content?("Mountain - 2")
      end

      click_link("Mountain - 0")

      assert_equal mountain_path(mountain), current_path
    end
  end

end
