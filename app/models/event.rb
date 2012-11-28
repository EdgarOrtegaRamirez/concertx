class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :soundcloud_artist_id, :soundcloud_artist_name, :soundcloud_track_name, :soundcloud_track_id, :date, :description, :price, :time_duration
  validates_presence_of :soundcloud_artist_id, :soundcloud_artist_name, :description, :time_duration, :date
  validates :price, numericality: true
end
