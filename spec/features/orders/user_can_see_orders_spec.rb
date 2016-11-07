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

    expect(page).to have_link("Order # #{order1.id}")
    expect(page).to have_link("Order # #{order2.id}")

  end

  scenario "A visitor can not see specific order" do
    user = create(:user)
    order = Order.create!(cost: 3, user_id: user.id)

    visit order_path(order)

    expect(page).to_not have_content("Ribbit")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  scenario "A visitor cannot see /orders" do

    visit orders_path

    expect(page).to have_content("You must be logged in to view your orders.")
  end

  scenario "A logged in user cannot see another user's orders" do
    user1, user2 = create_list(:user, 2)
    trip = create(:trip)
    order = Order.create(cost:4, user_id: user1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

    visit order_path(order)
    
    expect(page).to_not have_content("Ribbit")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
