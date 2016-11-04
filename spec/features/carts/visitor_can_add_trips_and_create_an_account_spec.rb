require 'rails_helper'

feature "Visitor can add trips and create account" do
  scenario "After account creation a vistior will still have trips in the cart" do

    trip1, trip2 = create_list(:trip, 2)

    visit trips_path

    within(:css, ".#{trip1.title}") do
      click_on "Hop on it!"
    end

    within(:css, ".#{trip2.title}") do
      click_on "Hop on it!"
    end

    visit cart_path

    expect(page).to have_no_button('Checkout')
    expect(page).to have_link("Login or Create Account to Checkout")

    click_on("Login or Create Account to Checkout")

    expect(current_path).to eq(new_user_path)

    fill_in :Email, with: "test@test.com"
    fill_in :Name, with: "Ben Pepper"
    fill_in :Password, with: "test"
    fill_in "user[password_confirmation]", with: "test"
    within(".new-user") do
      click_on 'Create Account'
    end

    visit cart_path

    expect(page).to have_content("#{trip1.title}")
    expect(page).to have_content("#{trip2.title}")
  end
end
