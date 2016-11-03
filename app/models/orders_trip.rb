class OrdersTrip < ApplicationRecord
  validates :trip_price, presence: :true
  validates :quantity, presence: :true
  validates :order_id, presence: :true
  validates :trip_id, presence: :true
  belongs_to :order
  belongs_to :trip

  def subtotal
    trip_price * quantity
  end
end
