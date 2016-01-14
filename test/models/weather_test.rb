class MountainTest < ActiveSupport::TestCase
  attr_reader :weather_object

  test 'Weather methods can be properly called' do
    VCR.use_cassette('forecast_io_service#forecast') do
      @weather_object = Weather.new(39.523, -104.325)

      assert weather_object.currently
      assert weather_object.minutely
      assert weather_object.hourly
      assert weather_object.daily
      assert weather_object.today
      assert weather_object.current_summary
      assert weather_object.next_hour_summary
      assert weather_object.next_24_hour_summary
      assert weather_object.next_hour_summary
      assert weather_object.current_wind_speed
      assert weather_object.current_precip_prob
      assert weather_object.current_precip_intensity
      assert weather_object.nearest_storm
      assert weather_object.todays_weather_summary
      assert weather_object.todays_max
      assert weather_object.todays_min
      assert weather_object.current_temp
      assert weather_object.current_temp_feels_like
      assert weather_object.week_summary
    end
  end

end
