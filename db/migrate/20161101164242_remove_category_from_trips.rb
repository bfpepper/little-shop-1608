class RemoveCategoryFromTrips < ActiveRecord::Migration[5.0]
  def change
    remove_reference :trips, :category, index: true, foreign_key: true
  end
end
