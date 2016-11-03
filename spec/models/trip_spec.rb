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

  context "truncate_description" do
    it "method can truncate first 25 letters of description" do
      trip =  Trip.create(description: "TestTestTesttestTestTESTESTESTESTEST", price: 1.23, image_url: "test.com", title: "test")

      expect(trip.truncate_description(trip.description)).to eq("TestTestTesttestTestTESTE")
      expect(trip.truncate_description(trip.description).length).to eq(25)
    end
  end
end
