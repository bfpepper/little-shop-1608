require 'rails_helper'

RSpec.describe OrdersTrip, type: :model do
  describe "validations" do
    it { should validate_presence_of(:trip_price) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:order_id) }
    it { should validate_presence_of(:trip_id) }
  end

  describe "relationships" do
    it { should respond_to(:trip) }
    it { should respond_to(:order) }
  end
end
