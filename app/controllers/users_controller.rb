class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(email: params['user']['email'],
                               snow_preference: params['user']['snow_preference'])
      flash["notice"] = "Your preferences have been updated!"
    else
      flash["alert"] = "There was an error, please try again."
    end
    redirect_to user_path
  end

  private

  def user_params
      params.require(:user).permit(:snow_preference, :email)
    end

end
