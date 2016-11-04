require "rails_helper"

describe "Admin Login" do
  scenario "When Admin logs in they see the admin dashboard" do

    admin = User.create!(name: "test", email: "test@test.com", password: "test", role: 1)

    visit login_path

    fill_in :Email, with: admin.email
    fill_in :Password, with: admin.password
    click_on "Log In!"

    expect(current_path).to eq(admin_dashboard_path)
  end
end
