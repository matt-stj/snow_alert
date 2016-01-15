class MountainsController < ApplicationController

  def show
    @mountain = Mountain.find(params[:id])
    @weather = Weather.new(@mountain.latitude, @mountain.longitude)
  end

  def search
    @mountains = Mountain.all
  end

  def index
    if params[:search]
      @mountains = Mountain.search(params[:search]).order("created_at DESC")
    else
      @mountains = Mountain.order("name ASC")
    end
  end

  private

  def truncate_coordinate(coordinate)
    string = sprintf "%.3f", coordinate
    string[0..(string.length - 2)]
  end

  def mountain_params
      params.require(:mountain).permit(:name, :latitue, :longitude)
    end


end
