class Weather
  attr_reader :data

  def initialize(latitude, longitude)
    @data = ForecastIOService.new.forecast(latitude, longitude)
  end

    def check_each_days_accumulation(user_accumulation)
      days = []
      daily.fetch(:data).each_with_index do |day, index|
        if day.has_key?(:precipAccumulation)
          day_accumulation = day.fetch(:precipAccumulation)
        else
          day_accumulation = 0
        end
        if day_accumulation >= user_accumulation
          days << [(Time.now + index.days), day_accumulation ]
        end
      end
      days
    end

  def currently
    data.fetch(:currently) if data[:currently]
  end

  def minutely
    data.fetch(:minutely) if data[:minutely]
  end

  def hourly
    data.fetch(:hourly) if data[:hourly]
  end

  def daily
    data.fetch(:daily) if data[:daily]
  end

  def today
    daily.fetch(:data).first
  end

  def current_summary
    currently.fetch(:summary)
  end

  def next_hour_summary
    if minutely
      minutely.fetch(:summary)
    else
      current_summary
    end
  end

  def next_24_hour_summary
    hourly.fetch(:summary)
  end

  def week_summary
    daily.fetch(:summary)
  end

  def current_temp
    currently.fetch(:temperature)
  end

  def current_temp_feels_like
    currently.fetch(:apparentTemperature)
  end

  def current_wind_speed
    currently.fetch(:windSpeed)
  end

  def current_precip_prob
    currently.fetch(:precipProbability)
  end

  def current_precip_intensity
    currently.fetch(:precipIntensity) if currently[:precipIntensity]
  end

  def nearest_storm
    if currently[:nearestStormDistance]
      currently.fetch(:nearestStormDistance)
    else
      "--"
    end
  end

  def todays_weather_summary
    today.fetch(:summary)
  end

  def todays_max
    today.fetch(:temperatureMax)
  end

  def todays_min
    today.fetch(:temperatureMin)
  end

end
