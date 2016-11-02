class AddRetiredColumnToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :retired, :boolean, default: false
  end
end
