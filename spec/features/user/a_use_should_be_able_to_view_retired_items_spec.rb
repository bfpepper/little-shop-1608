require 'rails_helper'


describe "Retired Trips" do
  scenario "A user can view retired items" do
     trip = Trip.create(title: "Jungle", description: "Eat bugs!", image_url: "http://www.theimaginativeconservative.org/wp-conte", price: 500.0, retired: 1)

     visit trip_path(trip)
     expect(current_path).to eq(trip_path(trip))


     expect(page).to have_content "Trip Retired"
     expect(page).to_not have_content "Hop on It!"
   end
end
