require 'rails_helper'

describe "Trip" do
  context "validations" do
    it "is invalid without a title" do
      trip = Trip.new(description: "test", image_url: "test.com", price: 1.23)
      expect(trip).to be_invalid
    end

    it "is invalid without a description" do
      trip = Trip.new(title: "test", image_url: "test.com", price: 1.23)
      expect(trip).to be_invalid
    end

    it "is invalid without a image url" do
      trip = Trip.new(description: "test", title: "test.com", price: 1.23)
      expect(trip).to be_invalid
    end

    it "is invalid without a price" do
      trip = Trip.new(description: "test", image_url: "test.com", title: "test")
      expect(trip).to be_invalid
    end

    it "is invalid without a unique title" do
      trip = Trip.create(description: "test", price: 1.23, image_url: "test.com", title: "test")
      trip2 = Trip.new(description: "test", price: 1.23, image_url: "test.com", title: "test")
      expect(trip2).to be_invalid
    end

  end

  context "relationships" do
    it "belongs to a category" do
      trip = Trip.new
      expect(trip).to respond_to(:categories)
    end
  end

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

end
