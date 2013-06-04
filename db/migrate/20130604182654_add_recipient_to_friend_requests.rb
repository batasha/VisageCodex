class AddRecipientToFriendRequests < ActiveRecord::Migration
  def change
    remove_column :friend_requests, :receiver_id
    add_column :friend_requests, :recipient_id, :integer
  end
end
