class MountainsController < ApplicationController

  def show
    @mountain = Mountain.find(params[:id])
    if stale?(last_modified: @mountain.updated_at, etag: @mountain.cache_key)
      @weather = Weather.new(@mountain.latitude, @mountain.longitude)
    else
      #nothing
    end
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
