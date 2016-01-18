require 'test_helper'

class AlertTest < ActiveSupport::TestCase
  test "Relevant alert data will be generated for a Users favorite resorts" do
    VCR.use_cassette('forecast_io_service#forecast', :allow_playback_repeats => true) do

      user = User.create(name: "Matt", snow_preference: 1)
      mountain = Mountain.create(name: "mountain", latitude: "39.523", longitude: "-104.325")

      user.favorites.create(mountain_id: mountain.id)
      alert = Alert.new(user)

      assert_kind_of(Array, alert.alert_data)
      assert_equal "mountain", alert.alert_data.first.keys.first
    end
  end
end
