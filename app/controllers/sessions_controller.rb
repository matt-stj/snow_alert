class SessionsController < ApplicationController

  def new
  end

  def create
     if user = User.from_omniauth(request.env["omniauth.auth"])
       session[:user_id] = user.id
       redirect_to edit_user_path(current_user)
     else
       flash[:notice] = "There was an error, please try again."
       redirect_to root_path
     end
  end

  def destroy
    session.clear
    flash[:notice] = "Thanks for visiting. You've been logged out."
    redirect_to root_path
  end

end
