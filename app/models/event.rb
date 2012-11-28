class Event < ActiveRecord::Base
  belongs_to :user
  paginates_per 6
  attr_accessible :soundcloud_artist_id, :soundcloud_artist_name, :soundcloud_track_name,
                  :soundcloud_track_id, :date, :description, :price, :time_duration,
                  :image
  validates_presence_of :soundcloud_artist_name, :description, :time_duration, :date
  validates :price, numericality: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x80>" }
end