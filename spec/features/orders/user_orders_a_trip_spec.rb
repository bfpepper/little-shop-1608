require 'rails_helper'

feature "User orders a trip" do
  context "user is logged in" do
    scenario "user navigates to cart with orders and clicks checkout" do
      user = create(:user)
      trip = create(:trip)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit root_path

      click_button("Hop on it!")
      click_button("View Cart (1)")
      click_button("Checkout")

      expect(page).to have_content("#{trip.title}")
      expect(page).to have_content("#{trip.price}")
      expect(page).to have_button("Place Order")
    end

    scenario "user can Place Order" do
      user = create(:user)
      trip = create(:trip)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit root_path

      click_button("Hop on it!")
      click_button("View Cart (1)")
      click_button("Checkout")
      click_button("Place Order")

      expect(page).to have_content("Thank you for your order!")
      expect(page).to have_content(trip.title)
      expect(page).to have_content("1")
    end
  end
end
