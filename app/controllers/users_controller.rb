class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(params)
      flash["notice"] = "Your preferences have been updated!"
      redirect_to user_path(@user)
    else
      flash["alert"] = "There was an error, please try again. #{@user.errors.full_messages.join(', ')}"
      redirect_to edit_user_path(@user)
    end
  end

  private

  def user_params
      params.require(:user).permit(:snow_preference, :email, :image_url, :name, :uid)
    end

end
