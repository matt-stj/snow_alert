class MountainsController < ApplicationController

  def show
    @mountain = Mountain.find(params[:id])
    @weather = Weather.new(@mountain.latitude, @mountain.longitude) if stale?(last_modified: @mountain.updated_at, etag: @mountain.cache_key)
  end

  def search
    @mountains = Mountain.all
  end

  def index
    @mountains = Mountain.all.order(state: :asc)
  end


  private

  def mountain_params
      params.require(:mountain).permit(:name, :latitue, :longitude)
    end


end
