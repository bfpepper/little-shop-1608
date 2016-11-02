require 'rails_helper'


feature "vistors visits trips index" do
  scenario "visitor can see all trips"  do
    trip1, trip2, trip3 = create_list(:trip, 3)

    visit trips_path

    expect(page).to have_content trip1.title
    expect(page).to have_content trip1.price
    expect(page).to have_content trip3.title
  end
end
