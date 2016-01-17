class MountainTest < ActiveSupport::TestCase
  attr_reader :weather_object

  test 'Weather methods can be properly called' do
    VCR.use_cassette('forecast_io_service#forecast') do
      @weather_object = Weather.new(39.523, -104.325)

      assert weather_object.currently
      assert_kind_of(Hash, weather_object.currently)

      assert weather_object.minutely
      assert_kind_of(Hash, weather_object.minutely)

      assert weather_object.hourly
      assert_kind_of(Hash, weather_object.hourly)

      assert weather_object.daily
      assert_kind_of(Hash, weather_object.daily)

      assert weather_object.today
      assert_kind_of(Hash, weather_object.today)

      assert weather_object.current_summary
      assert_equal "Partly Cloudy", weather_object.current_summary

      assert weather_object.next_hour_summary
      assert_equal "Partly cloudy for the hour.", weather_object.next_hour_summary

      assert weather_object.next_24_hour_summary
      assert_equal "Partly cloudy throughout the day.", weather_object.next_24_hour_summary

      assert weather_object.week_summary
      assert_equal "Light snow (under 1 in.) on Saturday through Wednesday, with temperatures falling to 33°F on Sunday.", weather_object.week_summary

      assert weather_object.current_wind_speed
      assert_equal 7.76, weather_object.current_wind_speed

      assert weather_object.current_precip_prob
      assert_equal 0, weather_object.current_precip_prob

      assert weather_object.current_precip_intensity
      assert_equal 0, weather_object.current_precip_intensity

      assert weather_object.nearest_storm
      assert_equal 244, weather_object.nearest_storm

      assert weather_object.todays_weather_summary
      assert_equal "Partly cloudy starting in the afternoon.", weather_object.todays_weather_summary

      assert weather_object.todays_max
      assert_equal 48.75, weather_object.todays_max

      assert weather_object.todays_min
      assert_equal 21.48, weather_object.todays_min

      assert weather_object.current_temp
      assert_equal 41.63, weather_object.current_temp

      assert weather_object.current_temp_feels_like
      assert_equal 36.7, weather_object.current_temp_feels_like

    end
  end

  test 'Checking a days accumulation' do
    VCR.use_cassette('forecast_io_service#forecast') do
      @weather_object = Weather.new(39.523, -104.325)

      user_snow_preference = 1
      days_accumulation = weather_object.check_each_days_accumulation(user_snow_preference)


      assert_kind_of(Array, days_accumulation)
      assert_kind_of(Time, days_accumulation.first[0])
      assert_equal 1.46, days_accumulation.first[1]
    end
  end

end
