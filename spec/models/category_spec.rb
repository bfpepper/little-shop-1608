require 'rails_helper'

describe "Category" do
  context "validations" do
    it "category is invalid without a title" do
      category = Category.new()

      expect(category).to be_invalid
    end

    it "category is invalid without a unique title" do
      category = Category.create(title: "test")
      category2 = Category.new(title: "test")

      expect(category2).to be_invalid
    end
  end

  context "relationships" do
    it "has many trips" do
      category = Category.new
      expect(category).to respond_to(:trips)
    end
  end
end
