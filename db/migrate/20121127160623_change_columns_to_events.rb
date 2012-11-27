class ChangeColumnsToEvents < ActiveRecord::Migration
  def change
    change_column :events, :price, :integer
  end
end
