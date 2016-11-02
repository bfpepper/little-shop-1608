require 'rails_helper'


describe "Retired Trips" do
  scenario "A user can view retired items" do
     trip1 = create(:trip)
     visit trip_path(trip1)
     expect(current_path).to eq(trip_path(trip1))


     expect(page).to have_content "Item Retired"
     expect(page).to_not have_content "Hop on It!"
   end
end








#
# As a user if I visit an item page and that item has been retired
# Then I should still be able to access the item page
# And I should not be able to add the item to their cart
# And I should see in place of the "Add to Cart" button or link - "Item Retired"
