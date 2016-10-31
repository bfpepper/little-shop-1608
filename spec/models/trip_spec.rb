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
end
