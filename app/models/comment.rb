class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :post_id, :likes

  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable

  validates :text, presence: true
end