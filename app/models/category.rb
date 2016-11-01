class Category < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :trips_categories
  has_many :trips, through: :trips_categories
end
