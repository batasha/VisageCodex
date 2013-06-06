class LikesController < ApplicationController
  before_filter :load_likeable

  def create
    @like = @likeable.likes.new(params[:like])
    @like.user_id = current_user.id

    @like.save
    redirect_to :back
  end

  def destroy
    @like = @likeable.likes.where(user_id: current_user.id).first
    @like.destroy
    redirect_to :back
  end

private

  def load_likeable
    resource, id = request.path.split('/')[-3..-2]
    @likeable = resource.singularize.classify.constantize.find(id)
  end
end