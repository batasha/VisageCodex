class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :avatar, :profile

  has_one :profile, class_name: "UserProfile"
  accepts_nested_attributes_for :profile

  validates :first_name, :last_name, presence: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
end
