class CreateTripsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :trips_categories do |t|
      t.references :trip, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
