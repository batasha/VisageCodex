class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def destroy
    redirect_to new_user_session_path
  end
end