class PostsController < ApplicationController
  def new
    @sender = current_user
    @recipient = User.find(params[:user_id])
    @post = @sender.posts.build

    @photo = @post.build_photo
  end

  def create
    @sender = current_user
    @recipient = User.find(params[:user_id])
    @post = @sender.posts.build(params[:post])
    @post.recipient_id = @recipient.id
    
    if @post.save
      redirect_to @recipient
    else
      render :new
    end
  end
end