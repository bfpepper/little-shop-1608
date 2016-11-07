feature "Admin trip viewing" do
  scenario "An admin can view list of trips with admin powers" do
    trip1, trip2 = create_list(:trip_with_category, 2)
    user = create(:user)
    user.admin!

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_trips_path
    
    expect(page).to have_link(trip1.title)
    expect(page).to have_link(trip2.title)
    expect(page).to have_content(trip1.retired)
    expect(page).to have_link("Edit")
  end
end
