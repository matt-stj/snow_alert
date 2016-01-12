class ForecastIOService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.forecast.io/forecast/#{ENV['forecast_io_api_key']}/")
  end

  def forecast(latitude, longitude)
    parse(connection.get("#{latitude},#{longitude}"))
  end

    private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

end
