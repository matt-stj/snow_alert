class MountainsController < ApplicationController

  def show
    @mountain = Mountain.find(params[:id])
    @weather = Weather.new(@mountain.latitude, @mountain.longitude)
  end

  def search
    location = Geocode.new(params[:search])
    record = location.closest_mountain(location.latitude, location.longitude)
    if record == []
      @mountain = Mountain.create(name: params[:search].titleize, latitude: location.latitude, longitude: location.longitude, state: location.state)
    else
      @mountain = Mountain.find(record.first.id)
    end
    redirect_to mountain_path(@mountain)
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
