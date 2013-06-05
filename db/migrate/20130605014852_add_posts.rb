class AddPosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :text
      t.integer :user_id
      t.integer :wall_id
      t.timestamps
    end
    add_attachment :posts, :photo
    add_index :posts, :user_id
    add_index :posts, :wall_id
  end
end