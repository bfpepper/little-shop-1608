require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "validations"
  it { should validate_numericality_of(:price) }
  it { should_not allow_value(0).for(:price) }
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:image_url)}
  it { should validate_uniqueness_of(:title)}
  it { should respond_to(:categories)}

  context "methods" do
    it "method can truncate first 25 letters of description" do
      trip =  Trip.create(description: "TestTestTasdasdasdasdestteadasdstTestTEdasdasdasdSTESTEasdasdasdsadSTESdasdasdasdasdsadasTEST", price: 1.23, image_url: "test.com", title: "test")

      expect(trip.truncate_description(trip.description)).to eq("TestTestTasdasdasdasdestteadasdstTestTEdasdasdasdSTESTEasdasdasdsadSTESdasda")
      expect(trip.truncate_description(trip.description).length).to eq(76)
    end
  end

  it "Trips to_param method" do
    trip = create(:trip)

    expect(trip.to_param) == trip.title
  end

  it "formate_not_retired method" do
    trip = create(:trip)

    expect(trip.retired).to eq("not_retired")
    expect(trip.formate_not_retired).to eq("not retired")
  end

  it "get_coordinates method" do
    trip = Trip.create(title: "Title1", description: "test", image_url: "test", price: 900.0, address: "Denver, Colorado")

    expected = [{lat: 39.7392358, lng: -104.990251}]
    expect(trip.get_coordinates).to eq(expected)
  end

  it "have_retired? method" do
    trip1 = Trip.create(title: "Title1", description: "test", image_url: "test", price: 900.0, address: "Denver, Colorado", retired: "not_retired")
    trip2 = Trip.create(title: "Title2", description: "test", image_url: "test", price: 900.0, address: "Denver, Colorado", retired: "retired")

    trips = Trip.all
    trips_not_retired = Trip.where(retired: "not_retired")

    expect(trips.have_retired?).to eq(true)
    expect(trips_not_retired.have_retired?).to eq(false)
  end

end
