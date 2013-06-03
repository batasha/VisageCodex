class UserProfilesController < ApplicationController
  def new
    @user_profile = current_user.build_profile(params[:user_profile])
  end

  def create
    @user_profile = current_user.build_profile(params[:profile])

    if @user_profile.save
      redirect_to @user_profile
    else
      render :new
    end
  end

  def show
    @user_profile = current_user.profile
  end

  def edit
    @user_profile = current_user.profile
  end

  def update
    @user_profile = current_user.profile

    if @user_profile.update_attributes(params[:user_profile])
      redirect_to @user_profile
    else
      render :edit
    end
  end
end