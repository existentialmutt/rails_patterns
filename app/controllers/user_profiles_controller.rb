class UserProfilesController < ApplicationController

  def show
    @user_profile = UserProfile.find(params[:id])
  end

  def edit
    @user_profile = UserProfile.find(params[:id])
  end

  def update
    @user_profile = UserProfile.find(params[:id])
    if @user_profile.update user_profile_params
      redirect_to @user_profile
    else
      render :edit
    end
  end

  private def user_profile_params
    params.require(:user_profile).permit(
      :full_name
    )
  end

end