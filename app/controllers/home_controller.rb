class HomeController < ApplicationController

  def index
    @forecast = ForecastIOService.new.forecast("39", "-104")
    binding.pry
  end

end
