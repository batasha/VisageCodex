class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @recipient = User.find(params[:user_id])
    @comment = @user.comments.build
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @recipient = User.find(params[:user_id])
    @comment = @user.comments.build(params[:comment])
    @comment.post_id = @post.id


    if @comment.save!
      redirect_to @recipient
    else
      render :back
    end
  end
end