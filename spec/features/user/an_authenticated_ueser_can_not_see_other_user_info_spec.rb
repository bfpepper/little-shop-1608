require "rails_helper"

describe "Authenticated user security" do
  scenario "As an authenticated user I can not see other user's info" do

    user1, user2 = create_list(:user, 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit login_path

    fill_in :Email, with: user1.email
    fill_in :Password, with: user1.password
    click_on "Log In!"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(user1.email)
    expect(page).to_not have_content(user2.email)
    expect(page).to have_content(user1.name)
    expect(page).to_not have_content(user2.name)

    click_on "Edit Profile"

    expect(page).to_not have_content("Role")

    visit admin_dashboard_path

    expect(page).to have_content("404")
  end
end
