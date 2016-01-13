class MountainsController < ApplicationController

  def show
    @mountain = Mountain.find(params[:id])
    @weather = Weather.new(@mountain.latitude, @mountain.longitude)
    UserMailer.alert(current_user).deliver_now
  end

end
