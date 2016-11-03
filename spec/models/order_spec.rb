require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "validations" do
    it { should validate_presence_of(:user_id) }
  end

  describe "relationships" do
    it { should respond_to(:trips) }
    it { should respond_to(:orders_trips) }
  end
end
