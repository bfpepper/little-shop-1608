class AddSubtotalToOrdersTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :orders_trips, :trip_price, :float
  end
end
