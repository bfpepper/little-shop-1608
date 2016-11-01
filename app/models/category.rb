class Category < ActiveRecord::Base
  has_many :trips
  validates :title, presence: true, uniqueness: true
end
