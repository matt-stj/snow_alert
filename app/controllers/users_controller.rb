class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(params)
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
