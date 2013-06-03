class UserProfilesController < ApplicationController
  def index
    @user_profiles = User.all
  end

  def new
    @user_profile = User.new(params[:user_profile])
  end

  def create
    @user_profile = User.new(params[:user_profile])
    @user_profile.save ? redirect_to @user_profile : render :new
  end

  def show
    @user_profile = User.find(params[:id])
  end

  def edit
    @user_profile = User.find(params[:id])
  end

  def update
    @user_profile = User.find(params[:id])

    if @user_profile.update_attributes(params[:user_profile])
      redirect_to @user_profile
    else
      render :edit
    end
  end
end