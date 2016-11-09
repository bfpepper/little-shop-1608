require 'rails_helper'

describe "as an admin when i visit /admin/dashboard " do
  scenario "i see admin dashboard" do
    user = create(:user)
    user.admin!

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/admin/dashboard'

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
  end
end

describe "as a registered user when i visit /admin/dashboard " do
  scenario "i see 404" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/admin/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end

describe "as a visitor when i visit /admin/dashboard " do
  scenario "i see 404" do

    visit '/admin/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
