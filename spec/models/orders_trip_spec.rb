require 'rails_helper'

RSpec.describe OrdersTrip, type: :model do
  describe "validations" do
    it { should validate_presence_of(:trip_price) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:order_id) }
    it { should validate_presence_of(:trip_id) }
  end

  describe "relationships" do
    it { should respond_to(:trip) }
    it { should respond_to(:order) }
  end

  describe "methods" do
    it "calculates_subtotal" do
      trip = create(:trip)
      user = create(:user)
      order = user.orders.create()
      cart = Cart.new( { "#{trip.id}" => 2 } )
      cart.place_order(order)

      expect(OrdersTrip.first.subtotal).to eq(trip.price*2)
    end

    it "returns trip_quantity" do
      trip = create(:trip)
      user = create(:user)
      order = user.orders.create()
      cart = Cart.new( { "#{trip.id}" => 2 } )
      cart.place_order(order)

      expect(OrdersTrip.trip_quantity).to eq(2)
    end
  end
end
