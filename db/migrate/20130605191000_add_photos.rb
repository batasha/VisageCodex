class AddPhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :post_id
      t.integer :album_id
      t.timestamps
    end
    add_attachment :photos, :image_file
  end
end
