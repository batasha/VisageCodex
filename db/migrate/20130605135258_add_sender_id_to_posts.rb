class AddSenderIdToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :user_id
    remove_column :posts, :wall_id
    add_column :posts, :sender_id, :integer
    add_column :posts, :recipient_id, :integer
    add_index :posts, :sender_id
    add_index :posts, :recipient_id
  end
end
