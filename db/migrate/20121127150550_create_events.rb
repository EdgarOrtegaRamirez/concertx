class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.string :time_duration
      t.string :artist
      t.float :price
      t.text :description

      t.timestamps
    end
  end
end
