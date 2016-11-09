require 'rails_helper'


describe "Cart" do
  context "methods" do
    it "total method gives a total of all" do
      contents = {"trip1" => 1, "trip2" => 3 }
      cart = Cart.new(contents)

      expect(cart.total).to eq(4)
    end
  end

    it "count_of counts the number of trips" do
      contents = {"1" => 1, "2" => 3 }
      cart = Cart.new(contents)

      expect(cart.count_of(2)).to eq(3)
  end

  it "total cost can sum the total coast of trips" do
    trip1, trip2 = create_list(:trip,2)
    contents = {"#{trip1.id}" => 2, "#{trip2.id}" => 2}
    cart = Cart.new(contents)

    expect(cart.total_cost).to eq((trip1.price * 2) + (trip2.price * 2))
  end

  it "trips count can count the number of trips for that trip" do
    trip1, trip2 = create_list(:trip,2)
    contents = {"#{trip1.id}" => 2, "#{trip2.id}" => 2}
    cart = Cart.new(contents)

    expect(cart.trips_count).to eq({trip1 => 2, trip2 => 2})
  end

  it "remove can remove a trip" do
    trip1, trip2 = create_list(:trip,2)
    contents = {"#{trip1.id}" => 2, "#{trip2.id}" => 3}
    cart = Cart.new(contents)

    expect(cart.remove(trip1.id.to_s)).to eq(2)
    expect(cart.contents).to eq({"#{trip2.id}" => 3})
  end

  it "update can update your cart" do
    trip = create(:trip)
    contents = {"#{trip.id}" => 2}
    cart = Cart.new(contents)
    cart.update(trip.id.to_s, 3)

    expect(cart.contents).to eq({"#{trip.id}" => 3})
  end

  it "can place_order" do
    trip = create(:trip)
    user = create(:user)
    order = user.orders.create()
    cart = Cart.new( { "#{trip.id}" => 1 } )
    cart.place_order(order)

    expect(OrdersTrip.count).to eq(1)
  end
end
