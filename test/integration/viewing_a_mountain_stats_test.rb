require 'test_helper'

class ViewingAMountainStatsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :mountain

  def setup
    @mountain = Mountain.create(name: "Vail", latitude: "39.523", longitude: "-104.325", state: "CO")
  end

  test "Viewing Mountain stats" do
    VCR.use_cassette('forecast_io_service#forecast') do

      visit mountain_path(mountain)

      assert page.has_content?("Vail, CO")

      within(".statistics") do
        assert page.has_content?("Today's High")
        assert page.has_content?("48°F")

        assert page.has_content?("Today's Low")
        assert page.has_content?("21°F")

        assert page.has_content?("Nearest Storm")
        assert page.has_content?("244mi")
        assert page.has_content?("244mi")
      end

      within(".vert-section") do
        assert page.has_content?("Currently: 41°F")
        assert page.has_content?("Feels like: 36°F")


        assert page.has_content?("Partly Cloudy")

        assert page.has_content?("Current Chance of Snow: 0% with 0")
      end

      within(".mtn-table") do
        assert page.has_content?("Day")
        assert page.has_content?("Thu, Jan 21")

        assert page.has_content?("Snow Probabilty")
        assert page.has_content?("0")

        assert page.has_content?("Accumulation")
        assert page.has_content?('0"')
      end
    end
  end
end
