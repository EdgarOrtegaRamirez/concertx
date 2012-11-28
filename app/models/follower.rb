class Follower < ActiveRecord::Base
  attr_accessible :follower_id, :user_id
  validates_uniqueness_of :user_id, scope: :follower_id
  belongs_to :user
  belongs_to :follower, class_name: "User"

  scope :following, lambda {|user_id| where(user_id: user_id) }

  def following

  end
end