class PostsController < ApplicationController
  def new
    @user = current_user
    @wall_id = params[:user_id]
    @post = @user.posts.build
  end

  def create
    @user = current_user
    @wall_id = params[:user_id]
    @post = @user.posts.build(params[:post])

    if @post.save
      redirect_to @wall_id
    else
      render :new
    end
  end
end