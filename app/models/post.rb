class Post < ActiveRecord::Base
  attr_accessible :text, :sender_id, :recipient_id, :photo

  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
end