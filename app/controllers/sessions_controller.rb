class SessionsController < ApplicationController

  def new
  end

  def create
       if user = User.find_by_uid(request.env["omniauth.auth"].uid)
         session[:user_id] = user.id
         redirect_to user_path(current_user)
       elsif user = User.from_omniauth(request.env["omniauth.auth"])
         session[:user_id] = user.id
         redirect_to edit_user_path(current_user)
       else
         redirect_to root_path
         flash[:notice] = "There was an error, please try again."
     end
  end

  def destroy
    session.clear
    flash[:notice] = "Thanks for visiting. You've been logged out."
    redirect_to root_path
  end

end
