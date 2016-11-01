require 'rails_helper'

feature "visitor clicks on Hop on it!" do
  scenario "visitor sees his cart count increase and a flash message" do
    trip1, trip2 = create_list(:trip, 2)

    visit trips_path

    expect(page).to have_content("Cart: 0")

    within(:css, ".#{trip1.title}") do
      click_on "Hop on it!"
    end

    expect(page).to have_content("Cart: 1")
    expect(page).to have_content("You have 1 #{trip1.title} trip in your cart.")

    within(:css, ".#{trip2.title}") do
      click_on "Hop on it!"
    end

    expect(page).to have_content("Cart: 2")
    expect(page).to have_content("You have 1 #{trip2.title} trip in your cart.")
  end
end
