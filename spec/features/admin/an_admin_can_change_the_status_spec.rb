require 'rails_helper'

describe 'an admin visists /dashboard' do
  scenario 'an admin can cancel an order' do
    trip1, trip2 = create_list(:trip, 22)

    admin_user = create(:user)
    admin_user.admin!
    user1, user2 = create_list(:user, 2)
    user1.orders.create(cost: 12, status: "ordered")
    user2.orders.create(cost: 12, status: "ordered")
    user1.orders.first.orders_trips.create(trip_id: trip1.id, quantity: 10, trip_price: trip1.price)
    user2.orders.first.orders_trips.create(trip_id: trip2.id, quantity: 10, trip_price: trip2.price)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

    visit admin_dashboard_path
    first(:button, "Cancel").click

    expect(user2.orders.last.status).to eq('cancelled')
    expect(user1.orders.last.status).to eq('ordered')
  end

  scenario 'an admin can mark order as paid' do
    trip1, trip2 = create_list(:trip, 22)

    admin_user = create(:user)
    admin_user.admin!
    user1, user2 = create_list(:user, 2)
    user1.orders.create(cost: 12, status: "ordered")
    user2.orders.create(cost: 12, status: "ordered")
    user1.orders.first.orders_trips.create(trip_id: trip1.id, quantity: 10, trip_price: trip1.price)
    user2.orders.first.orders_trips.create(trip_id: trip2.id, quantity: 10, trip_price: trip2.price)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

    visit admin_dashboard_path
    first(:button, "Mark Paid").click
    expect(user2.orders.last.status).to eq('paid')
    expect(user1.orders.last.status).to eq('ordered')
  end
end
