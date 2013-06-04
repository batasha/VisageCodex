class FriendRequestsController < ApplicationController
  def create
    @recipient = User.find(params[:user_id])
    @friend_request = current_user.sent_friend_requests.create(
                        recipient_id: @recipient.id,
                        status: "pending" )

    redirect_to user_path(@recipient)
  end

  def destroy
    @recipient = User.find(params[:user_id])
    @friend_request = current_user.sent_friend_requests.where(
                        recipient_id: @recipient.id,
                        status: "pending" ).first

    @friend_request.destroy
    redirect_to user_path(@recipient)
  end

  def accept
    @user = current_user
    @sender = User.find(params[:user_id])
    @friend_request = current_user.received_friend_requests.where(
                        sender_id: @sender.id,
                        status: "pending" ).first

    @friend_request.update_attribute(:status, "accepted")
    Friendship.create([{user_id: current_user.id, friend_id: @sender.id},
                       {user_id: @sender.id, friend_id: current_user.id}])

    redirect_to user_path(@sender)
  end

  def reject
    @user = current_user
    @sender = User.find(params[:user_id])
    @friend_request = current_user.received_friend_requests.where(
                        sender_id: @sender.id,
                        status: "pending" ).first

    @friend_request.update_attribute(:status, "rejected")

    redirect_to user_path(@sender)
  end
end