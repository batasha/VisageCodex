class Profile < ActiveRecord::Base
  attr_accessible :user_id, :birthday, :gender, :location, :biography

  belongs_to :user

  validates :gender, inclusion: {in: ["male", "female"]}
end