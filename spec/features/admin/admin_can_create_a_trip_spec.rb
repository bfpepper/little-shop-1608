require "rails_helper"

describe "Admin trip creation" do
  scenario "An admin can create a new trip" do

    cat1, cat2 = create_list(:category, 2)

    user = create(:user)
    user.admin!

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_trip_path

    fill_in :Title, with: "Trip1"
    fill_in :Description, with: "You can go here?"
    fill_in :Price, with: "100"
    fill_in 'trip[image_url]', with: "www.google.com"
    select "#{cat1.title}", from: 'trip[category_ids]'
    click_on "Create Trip"

    visit trips_path

    expect(page).to have_content("Trip1")
  end

  scenario "An admin MUST enter ALL info for a new trip" do

    cat1, cat2 = create_list(:category, 2)

    user = create(:user)
    user.admin!

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_trip_path

    fill_in :Title, with: "Trip1"
    fill_in :Description, with: "You can go here?"
    fill_in 'trip[image_url]', with: "www.google.com"
    select "#{cat1.title}", from: 'trip[category_ids]'

    click_on "Create Trip"

    expect(current_path).to eq(new_admin_trip_path)
  end
end
