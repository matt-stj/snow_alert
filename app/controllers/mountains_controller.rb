class MountainsController < ApplicationController

  def show
    @mountain = Mountain.find(params[:id])
    @weather = Weather.new(@mountain.latitude, @mountain.longitude)
  end

end
