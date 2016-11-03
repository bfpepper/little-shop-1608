require 'rails_helper'

feature "User visits a specific order" do
  scenario "it has all relevant information" do
    user = create(:user)
    trip = create(:trip)
    order1 = Order.create!(cost:4, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_button("Hop on it!")
    click_button("View Cart (1)")
    click_button("Checkout")
    click_button("Place Order")

    order2 = Order.last

    click_link("Order # #{order2.id}")
    expect(page).to have_content(trip.title)
    expect(page).to have_content("1")
    expect(page).to have_content(trip.price)
    expect(page).to have_content(order2.status)

    visit orders_path

    expect(page).to have_content(order1.cost)
    expect(page).to have_content(order2.cost)
  end

  scenario "A visitor can not see /orders" do
    user = create(:user)
    order = Order.create!(cost: 3, user_id: user.id)

    visit order_path(order)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
