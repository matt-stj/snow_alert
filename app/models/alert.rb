class Alert
  attr_reader :user
  attr_accessor :resort_data

  def initialize(user)
    @user = user
  end

  def to_send?
    resort_data = []
    user.favorites.each do |favorite|
      forecast = Weather.new(favorite.mountain.latitude, favorite.mountain.longitude)
      resort_accumulation_comparison = forecast.check_each_days_accumulation(user.pow_amount)
        if  resort_probability_comparison == [] && resort_accumulation_comparison == []
          next
        else
          resort_data << {resort.name => {"probability" => resort_probability_comparison} }
          r  = resort_data.find { |x| x[resort.name] }
          r[resort.name]["accumulation"] = resort_accumulation_comparison
        end
    end
    resort_data
    #theres an edge case where someones prob is so high, that it doesn't show up in the resort data hash before accumultaion goes in.
  end

end
