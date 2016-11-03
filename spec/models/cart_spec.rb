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
end
