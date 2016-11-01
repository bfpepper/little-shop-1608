require 'spec_helper'


describe "Creating an Account" do
  scenario "a visitor can create an account" do

    visit login_path
    click_on "Create Account"

    fill_in :Email, with: "aciccone@bu.edu"
    fill_in :Name, with: "Anthony Ciccone"
    fill_in :Password, with: "raph"
    fill_in "user[password_confirmation]", with: "raph"
    click_on "Create User"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content "Logged in as Anthony Ciccone"
    expect(page).to have_content "aciccone@bu.edu"
    expect(page).to_not have_content "Login"
    expect(page).to have_content "Logout"
  end
end
#
# As a visitor
# When I visit "/login
# And when I click link "Create Account"
# And I fill in my desired credentials
# And I submit my information
# Then my current page should be "/dashboard"
# And I should see a message in the navbar that says "Logged in as SOME_USER"
# And I should see my profile information
# And I should not see a link for "Login"
# And I should see a link for "Logout"
