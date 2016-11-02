require "rails_helper"

describe "Logging in" do
  context "successfully logs in" do
    scenario "a user can login to their account" do
      User.create(name: "Anthony Ciccone", email: "a@gmail.com",  password: "123", password_confirmation: "123")

      visit login_path
      fill_in :Email, with: "a@gmail.com"
      fill_in :Password, with: "123"
      click_button "Log In!"

      expect(page).to have_content "a@gmail.com"
      expect(page).to have_content "Anthony"
      expect(page).to have_content "You Successfully Logged in!"
      expect(current_path).to eq(dashboard_path)
    end
  end

  context "user enters wrong password" do
    scenario "a user enters the wrong password to their accunt" do
      User.create(name: "Anthony Ciccone", email: "a@gmail.com",  password: "123", password_confirmation: "123")

      visit login_path
      fill_in :Email, with: "a@gmail.com"
      fill_in :Password, with: "12"
      click_button "Log In!"

      expect(page).to have_content "Email and password don't match"
      expect(current_path).to eq(login_path)
    end
  end
end
