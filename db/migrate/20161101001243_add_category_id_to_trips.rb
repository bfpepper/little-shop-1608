class AddCategoryIdToTrips < ActiveRecord::Migration[5.0]
  def change
    add_reference :trips, :category, foreign_key: true
  end
end
