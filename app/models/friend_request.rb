class FriendRequest < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id, :status, :recipient, :sender

  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :status, inclusion: {in: ["pending", "accepted", "rejected"]}
end