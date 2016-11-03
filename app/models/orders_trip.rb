class OrdersTrip < ApplicationRecord
  belongs_to :order
  belongs_to :trip

  def subtotal
    trip_price * quantity
  end
end
