class Post < ActiveRecord::Base
  attr_accessible :text, :user_id, :wall_id, :photo

  belongs_to :user
  belongs_to :wall, class_name: "User"
end