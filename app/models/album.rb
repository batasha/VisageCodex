class Album < ActiveRecord::Base
  attr_accessible :user_id, :name

  belongs_to :user
  has_many :photos
end