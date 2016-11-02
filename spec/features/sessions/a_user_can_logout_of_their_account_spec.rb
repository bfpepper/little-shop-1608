require 'rails_helper'

describe "Logging out" do
  scenario "a user can log out of there account once logged in" do
    User.create(name: "Anthony Ciccone", email: "a@gmail.com",  password: "123", password_confirmation: "123")
    visit login_path
    fill_in :Email, with: "a@gmail.com"
    fill_in :Password, with: "123"
    click_button "Log In!"
    expect(page).to have_content "You Successfully Logged in!"
    expect(page).to have_content "You Successfully Logged in!"

    click_on "Logout"
    expect(page).to have_content "You Successfully Logged out!"
    expect(page).to have_content "Login"
    expect(current_path).to eq(trips_path)
  end
end
