class Trip < ActiveRecord::Base
  validates :title, :description, :image_url, :price, presence: true
  validates :title, uniqueness: true
  has_many :trips_categories, dependent: :destroy
  has_many :categories, through: :trips_categories
  has_many :orders_trips, dependent: :destroy
  has_many :orders, through: :orders_trips

  enum retired: %w(not_retired retired)

  def to_param
    "#{id}-#{slug}"
  end

  def truncate_description(trip)
    trip[0..24]
  end

  def self.trip_titles
    pluck(:title).join(", ")
  end

  def slug
    title.downcase.gsub(" ", "-")
  end
end
