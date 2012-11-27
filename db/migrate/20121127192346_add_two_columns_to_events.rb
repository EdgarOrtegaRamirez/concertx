class AddTwoColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :soundcloud_artist_id, :integer
    add_column :events, :soundcloud_track_id, :integer
    remove_column :events, :artist
  end
end
