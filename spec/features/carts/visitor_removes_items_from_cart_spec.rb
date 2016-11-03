require 'rails_helper'

feature "visitor views cart and clicks remove" do
  scenario "visitor no longer sees those items in cart" do
    trip = create(:trip)

    visit '/trips'

    within(:css, ".#{trip.title}") do
      click_on "Hop on it!"
    end

    click_on "View Cart (1)"
    click_on "X"

    within(".success") do
      expect(page).to have_link("#{trip.title}")
    end

    within(".cart-contents") do
      expect(page).to_not have_content(trip.title)
    end
  end
end
