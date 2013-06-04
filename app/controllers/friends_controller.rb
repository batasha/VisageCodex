class FriendsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def create
    @friendship = Friendship.new

    if @friendship.save
      Friendship.create( user_id: @friendship.friend_id,
                         friend_id: @friendship.user_id )

      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    inverse_friendship = Friendship.where( user_id: @friendship.friend_id,
                         friend_id: @friendship.user_id ).first

    @friendship.destroy
    inverse_friendship.destroy
    redirect_to user_path(params[:id])
  end
end