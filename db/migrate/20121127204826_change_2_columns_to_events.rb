class Change2ColumnsToEvents < ActiveRecord::Migration
  def change
    change_column :events, :soundcloud_track_id, :string
  end
end
