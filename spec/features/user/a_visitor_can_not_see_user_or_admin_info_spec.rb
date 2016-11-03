require "rails_helper"

describe "What visitors get to see" do
  scenario "A visitor can not see user or admin info" do

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")

    visit dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist.")

    visit new_user_path

    expect(page).to_not have_content("Role")
  end
end
# I should be redirected to login/create account when I try to check out.
# already a function in the spec/features/cart folder.
