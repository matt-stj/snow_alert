class MountainsController < ApplicationController

  def show
    @mountain = Mountain.find(params[:id])
    @forecast = ForecastIOService.new.forecast(@mountain.latitude, @mountain.longitude)
  end

end
