class CreateUserProfile < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.date :birthday
      t.string :gender
      t.string :location
      t.text :biography

      t.timestamps
    end
    add_index :user_profiles, :user_id
  end
end
