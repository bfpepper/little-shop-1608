require 'rails_helper'


describe "An authorized admin visits /dashboard" do
  scenario "an admin can view all orders" do
    trip1, trip2 = create_list(:trip, 22)

    admin_user = create(:user)
    admin_user.admin!
    user1, user2 = create_list(:user, 2)
    user1.orders.create(cost: 12, status: "ordered")
    user2.orders.create(cost: 12, status: "Paid")
    user1.orders.first.orders_trips.create(trip_id: trip1.id, quantity: 10, trip_price: trip1.price)
    user2.orders.first.orders_trips.create(trip_id: trip2.id, quantity: 10, trip_price: trip2.price)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    visit admin_dashboard_path

    expect(page).to have_content("User")
    expect(page).to have_content("Order Date")
    expect(page).to have_content("Trip Name")
    expect(page).to have_content("Quantity")
    expect(page).to have_content("Subtotal")
    expect(page).to have_content("Status")
  end


  scenario "an admin can view orders by specific category" do
    pending "works with qt and webkit"
    trip1, trip2 = create_list(:trip, 2)

    admin_user = create(:user)
    admin_user.admin!
    user1, user2 = create_list(:user, 2)
    user1.orders.create(cost: 12, status: "ordered")
    user2.orders.create(cost: 12, status: "paid")
    user1.orders.first.orders_trips.create(trip_id: trip1.id, quantity: 10, trip_price: trip1.price)
    user2.orders.first.orders_trips.create(trip_id: trip2.id, quantity: 10, trip_price: trip2.price)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    visit admin_dashboard_path

    select 'paid', from: 'status'

      expect(page).to have_content(trip2.title)
      expect(page).to_not have_content(trip1.title)
  end
end
