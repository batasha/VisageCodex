class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:new, :create]

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
      @user.albums.create(name: "Default")
      sign_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.includes(:profile).find(params[:id])
    @profile = @user.profile
    @sent_friend_request = current_user.sent_friend_requests.where(
                        recipient_id: @user.id,
                        status: "pending" ).first
    @received_friend_request = current_user.received_friend_requests.where(
                        sender_id: @user.id,
                        status: "pending" ).first

    current_status = @user.posts.where(recipient_id: @user.id).last

    @status = current_status ? current_status.text : ""
  end

  def edit
    @user = current_user
  end

  def edit_avatar
    @user = current_user
    @avatar = @user.avatar
  end

  def update_avatar
    @user = current_user
    @avatar = @user.avatar

    if @user.update_attribute(:avatar, params[:user][:avatar])
      redirect_to settings_account_path(current_user)
    else
      render :edit_avatar
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attribute(:avatar, params[:avatar])
      redirect_to settings_account_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to new_user_path
  end

  def wall
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @comment = Comment.new
    @sender = current_user
  end

  def news
    @user = current_user
    @friends = @user.friends
    @posts = @user.news_posts.includes(:comments)
    @comment = Comment.new
  end
end