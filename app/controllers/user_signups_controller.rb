class UserSignupsController < ApplicationController

  def new
    @user_signup = UserSignup.new
  end

  def create
    @user_signup = UserSignup.new user_signup_params
    if @user_signup.save
      redirect_to @user_signup.user_profile
    else
      render :new
    end
  end

  private def user_signup_params
    params.require(:user_signup).permit(
      :email,
      :accepts_terms_of_service
    )
  end

end