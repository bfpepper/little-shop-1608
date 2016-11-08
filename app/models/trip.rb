class Trip < ActiveRecord::Base
  validates :title, :description, :image_url, :price, presence: true
  validates :title, uniqueness: true
  has_many :trips_categories, dependent: :destroy
  has_many :categories, through: :trips_categories
  has_many :orders_trips, dependent: :destroy
  has_many :orders, through: :orders_trips
  geocoded_by :address
  after_validation :geocode

  enum retired: %w(not_retired retired)

  def to_param
    "#{id}-#{slug}"
  end

  def truncate_description(trip)
    trip[0..75]
  end

  def self.trip_titles
    pluck(:title).join(", ")
  end

  def slug
    title.downcase.gsub(" ", "-")
  end

  def self.search(search_term)
    Trip.where("title like ?", "%#{search_term}%") + Trip.where("description like ?", "%#{search_term}%")
  end

  def formate_not_retired
    retired.gsub("_", " ")
  end
end
