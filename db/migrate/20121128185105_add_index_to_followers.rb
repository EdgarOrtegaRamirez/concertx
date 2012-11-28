class AddIndexToFollowers < ActiveRecord::Migration
  def change
    add_index "followers", ["user_id", "follower_id"], name: "index_followers_on_user_id_and_follower_id", unique: true
  end
end
