class Order < ApplicationRecord
  validates :user_id, presence: :true
  belongs_to :user
  has_many :orders_trips
  has_many :trips, through: :orders_trips
end
