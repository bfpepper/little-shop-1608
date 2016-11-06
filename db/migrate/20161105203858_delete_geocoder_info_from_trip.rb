class DeleteGeocoderInfoFromTrip < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :latitude
    remove_column :trips, :longitude
    remove_column :trips, :address
  end
end
