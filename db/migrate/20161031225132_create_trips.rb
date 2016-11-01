class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.float :price
    end
  end
end
