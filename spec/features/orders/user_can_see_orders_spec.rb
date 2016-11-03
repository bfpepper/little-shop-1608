require 'rails_helper'
require 'action_view'

RSpec.configure do |c|
  c.include ActionView::Helpers::DateHelper
end

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
    expect(page).to have_content(order.created_at.strftime("%b %d, %Y at %l:%M %P"))
    expect(page).to have_link("#{trip.title}")
  end

end
