class SessionsController < ApplicationController

  def new
  end

  def create
    binding.pry
    redirect_to root_path
  end

end
