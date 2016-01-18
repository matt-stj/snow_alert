class MountainsController < ApplicationController

  def show
    @mountain = Mountain.find(params[:id])
    @weather = Weather.new(@mountain.latitude, @mountain.longitude)
  end

  def search
    @mountains = Mountain.order(state: :asc)
  end

  def index
    @mountains = Mountain.order("name ASC")
  end


  private

  def mountain_params
      params.require(:mountain).permit(:name, :latitue, :longitude)
    end


end
