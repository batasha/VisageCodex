class Photo < ActiveRecord::Base
  attr_accessible :post_id, :album_id, :image_file

  belongs_to :album
  has_one :owner, through: :album, source: :user

  has_attached_file :image_file, styles: {large: "700x700>", small: "300x300>"}
end