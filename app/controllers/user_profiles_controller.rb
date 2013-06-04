class ProfilesController < ApplicationController
  def new
    @profile = current_user.build_profile(params[:profile])
  end

  def create
    @profile = current_user.build_profile(params[:profile])

    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def show
    @profile = current_user.profile
  end

  def edit
    debugger
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update_attributes(params[:profile])
      redirect_o @profile
    else
      render :edit
    end
  end
end