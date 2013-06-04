class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :avatar, :profile, :profile_attributes

  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :sent_friend_requests, class_name: "FriendRequest",
           foreign_key: :sender_id
  has_many :received_friend_requests, class_name: "FriendRequest",
           foreign_key: :recipient_id

  has_many :messages, class_name: "Message", foreign_key: :recipient_id
  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id

  validates :first_name, :last_name, presence: true
  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "50x50>" }

  def full_name
    "#{first_name} #{last_name}"
  end
end
