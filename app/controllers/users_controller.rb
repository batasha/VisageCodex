class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.includes(:profile).find(params[:id])
    @profile = @user.profile
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attribute(:avatar, params[:avatar])
      redirect_to settings_account(current_user)
    else
      render :edit
    end
  end
end