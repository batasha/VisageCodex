class AccountsController < ApplicationController
  def settings
    @user = current_user
    @profile = @user.profile
  end
end