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
    @friendship = Friendship.find(params[:id])
    inverse_friendship = Friendship.where( user_id: @friendship.friend_id,
                         friend_id: @friendship.user_id )

    @friendship.destroy
    inverse_friendship.destroy
  end
end