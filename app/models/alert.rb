class Alert
  attr_reader :user
  attr_accessor :alert_data

  def initialize(user)
    @user = user
  end

  def alert_data
    mountain_data = []
    user.favorites.each do |favorite|
      forecast = Weather.new(favorite.mountain.latitude, favorite.mountain.longitude)
      mountain_accumulation_comparison = forecast.check_each_days_accumulation(user.snow_preference)
        if mountain_accumulation_comparison == []
        else
          mountain_data << { favorite.mountain.name => mountain_accumulation_comparison } 
        end
    end
    # user.update_attributes(newest_forecast: mountain_data)
    mountain_data
  end

  def to_send?
    return true if alert_data != []
  end

  # mountain_data.first.fetch("Copper Mountain").fetch(:accumulation)

end
