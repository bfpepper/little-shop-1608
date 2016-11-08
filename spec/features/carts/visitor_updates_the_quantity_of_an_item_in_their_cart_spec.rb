require 'rails_helper'

feature "visitor changes the dropdown and clicks update" do
  self.use_transactional_tests = false
  scenario "visitor sees their total price update", js: true do
    trip = create(:trip)

    visit '/trips'

    within(:css, ".#{trip.title}") do
      click_on "Hop on it!"
    end

    click_on "View Cart (1)"
    select 5, from: 'quantity'

    expect(page).to have_button("View Cart (5)")
  end
end
