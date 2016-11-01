require 'rails_helper'

feature "visitor visits category show page" do
  scenario "visitor can view all trips in that category" do
    trip1, trip2 = create_list(:trip_with_category, 2)
    category = trip1.categories.first
    trip3 = category.trips.create(title: "test", description: "test", price: 1.23, image_url: "url")
    visit "/#{category.title}"

    expect(page).to have_content trip1.title
    expect(page).to have_content trip3.title
  end
end
