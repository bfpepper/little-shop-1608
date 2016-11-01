class Trip < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, :image_url, :price, presence: true
  validates :title, uniqueness: true
end
