require 'rails_helper'


describe "Retired Trips" do
  scenario "A user can view retired items" do
     a = Trip.create(title: "Jungle", description: "Eat bugs!", image_url: "http://www.theimaginativeconservative.org/wp-conte", price: 500.0, retired: 1)

     visit trip_path(a)
     expect(current_path).to eq(trip_path(a))


     expect(page).to have_content "Trip Retired"
     expect(page).to_not have_content "Hop on It!"
   end
end








#
# As a user if I visit an item page and that item has been retired
# Then I should still be able to access the item page
# And I should not be able to add the item to their cart
# And I should see in place of the "Add to Cart" button or link - "Item Retired"
