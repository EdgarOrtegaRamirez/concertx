class AddOneColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :soundcloud_artist_name, :string
    add_column :events, :soundcloud_track_name, :string
  end
end
