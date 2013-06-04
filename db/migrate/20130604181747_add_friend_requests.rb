class AddFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :status
      t.timestamps
    end
    add_index :friend_requests, :sender_id
    add_index :friend_requests, :receiver_id
  end
end
