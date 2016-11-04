require 'rails_helper'

feature "visitor visits create account page" do
  describe "visitor forgets to input their name" do
    scenario "visitor sees error flash" do

      visit new_user_path
      fill_in 'user[email]', with: "jim@jim.com"
      fill_in 'user[password]', with: 'butt'
      fill_in 'user[password_confirmation]', with: 'butt'
      within(".new-user") do
        click_on 'Create Account'
      end
      expect(page).to have_content("You have failed to create an account.")
    end
  end

  describe "visitor forgets to input their email" do
    scenario "visitor sees error flash" do

      visit new_user_path
      fill_in 'user[name]', with: "jim"
      fill_in 'user[password]', with: 'butt'
      fill_in 'user[password_confirmation]', with: 'butt'
      within(".new-user") do
        click_on 'Create Account'
      end
      expect(page).to have_content("You have failed to create an account.")
    end
  end

  describe "visitor forgets to input their password" do
    scenario "visitor sees error flash" do

      visit new_user_path
      fill_in 'user[name]', with: "jim"
      fill_in 'user[email]', with: 'jim@jim.com'
      fill_in 'user[password_confirmation]', with: 'butt'
      within(".new-user") do
        click_on 'Create Account'
      end
      expect(page).to have_content("You have failed to create an account.")
    end
  end

  describe "visitor forgets to input their password confirmation" do
    scenario "visitor sees error flash" do

      visit new_user_path
      fill_in 'user[name]', with: "jim"
      fill_in 'user[email]', with: 'jim@jim.com'
      fill_in 'user[password]', with: 'butt'
      within(".new-user") do
        click_on 'Create Account'
      end
      expect(page).to have_content("You have failed to create an account.")
    end
  end

  describe "visitor's password and confimation don't match" do
    scenario "visitor sees error flash" do

      visit new_user_path
      fill_in 'user[name]', with: "jim"
      fill_in 'user[email]', with: 'jim@jim.com'
      fill_in 'user[password]', with: 'butt'
      fill_in 'user[password_confirmation]', with: 'ass'
      within(".new-user") do
        click_on 'Create Account'
      end
      expect(page).to have_content("You have failed to create an account.")
    end
  end
end
