require 'rails_helper'

feature "User visits a specific order" do
  scenario "it has all relevant information" do
    user = create(:user)
    trip = create(:trip)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_button("Hop on it!")
    click_button("View Cart (1)")
    click_button("Checkout")
    click_button("Place Order")

    order = Order.first
    click_link("Order # #{order.id}")

    expect(page).to have_content(trip.title)
    expect(page).to have_content("1")
    expect(page).to have_content(trip.price)
    expect(page).to have_content(order.status)
  end

  scenario "A visitor can not see /orders" do
    user = create(:user)
    order = Order.create!(cost: 3, user_id: user.id)

    visit order_path(order)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end

# Fix the feature test for logged in user visiting the orders page and seeing multiple orders.
# Currently this feature test only has one order and thus does not test that the page is properly iterating and displaying all of the orders.
