require "spec_helper"

RSpec.describe "Create account" do
  scenario "Guest user can create an acount" do

  visit root_path

  click_on "Login"

  expect(current_path).to eq(login_path)
  expect(page).to have_content("Email")
  expect(page).to have_content("Password")
  expect(page).to have_link("Create Account", href: new_user_path)
  end
end
