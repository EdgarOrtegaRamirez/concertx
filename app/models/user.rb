class User < ActiveRecord::Base

  has_many :events
  has_many :followers, class_name: 'Follower', foreign_key: 'follower_id'
  has_many :following, class_name: 'Follower', foreign_key: 'user_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
end