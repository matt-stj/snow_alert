require './test/test_helper'

class ForecastIOServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = ForecastIOService.new
  end

  test '#forecast' do
    VCR.use_cassette('forecast_io_service#forecast') do
      forecast = service.forecast(39.523, -104.325)
    end
  end

end
