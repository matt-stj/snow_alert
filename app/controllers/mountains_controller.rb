class MountainsController < ApplicationController

  def show
    @mountain = Mountain.find(params[:id])
    @weather = Weather.new(@mountain.latitude, @mountain.longitude)
  end

  def search
    coordinates = Geocode.new(params[:search]).assign_values
    @mountain = Mountain.find_or_create_by_latitude_and_longitude(name: params[:search])
    @weather = Weather.new()
    binding.pry
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

end
