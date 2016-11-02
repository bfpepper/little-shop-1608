class AddRetiredColumnToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :retired, :integer, default: 0
  end
end
