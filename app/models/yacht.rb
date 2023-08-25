class Yacht < ApplicationRecord
  has_many_attached :photos
  has_many :reviews
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  # , uniqueness: true
  validates :amenities, inclusion: { in: (["bathroom", "swimming pool", "wifi", "helipad", "gym", "cinema", "basketball court", "aircon", "heating"]),
                                     message: "%{value} is not a valid amenity" }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :location, presence: true
  validates :price_per_night, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
