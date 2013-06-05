class Post < ActiveRecord::Base
  attr_accessible :text, :sender_id, :recipient_id, :photo, :sender,
                  :recipient, :photo_attributes

  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
  has_many :comments

  has_one :photo
  accepts_nested_attributes_for :photo
end