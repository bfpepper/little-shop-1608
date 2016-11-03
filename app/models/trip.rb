class Trip < ActiveRecord::Base
  validates :title, :description, :image_url, :price, presence: true
  validates :title, uniqueness: true
  has_many :trips_categories
  has_many :categories, through: :trips_categories
  has_many :orders_trips
  has_many :orders, through: :orders_trips

  enum retired: %w(not_retired retired)

  def to_param
    title
  end

  def truncate_description(trip)
    trip[0..24]
  end

end
