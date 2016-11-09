require 'rails_helper'

describe "Viewing an order page as an admin" do
  scenario "An admin can view a user's order" do
    trip1 = create(:trip)
    user1 = create(:user)

    admin_user = create(:user)
    admin_user.admin!
    user1.orders.create(cost: 1620.0, status: "ordered")
    user1.orders.first.orders_trips.create(trip_id: trip1.id, quantity: 10, trip_price: trip1.price)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    visit admin_dashboard_path

    click_on trip1.title


    expect(page).to have_content(user1.orders.first.created_at.strftime("%b %d, %Y at %l:%M %P"))
    expect(page).to have_link(trip1.title)
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user1.name)
    expect(page).to have_link(trip1.title)
    expect(page).to have_content("Quantity")
    expect(page).to have_content("Quantity")
    expect(page).to have_content("1620.0")
    expect(page).to have_content(user1.orders.first.status)
  end
end
