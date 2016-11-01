require "spec_helper"

RSpec.describe "Create account" do
  scenario "Guest user can create an acount" do

  visit root_path

  click_on "Login"

  expect(current_path).to eq(login_path)
  expect(page).to have_content("Email")
  expect(page).to have_content("Password")
  save_and_open_page
  expect(page).to have_link("Create Account", href: new_user_path)
  end
end

# As a visitor
# When I visit "/"
# Then I should see a link for "Login"
# And when I click "Login"
# And I should be on the "/login" page
# I should see a place to insert my credentials to login
# And I should see a link to "Create Account"
