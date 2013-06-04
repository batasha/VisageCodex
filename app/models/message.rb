class Message < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id, :status, :body, :recipient

  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :status, inclusion: {in: ["read", "unread"]}
end