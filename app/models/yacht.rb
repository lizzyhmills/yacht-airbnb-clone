class Yacht < ApplicationRecord
  has_many_attached :photos
  belongs_to :user, dependent: :destroy
  has_many :bookings
  validates :name, presence: true, uniqueness: true
  validates :amenities, inclusion: { in: (["bathroom", "swimming pool", "wifi", "helipad", "gym", "cinema", "basketball court", "aircon", "heating"]),
    message: "%{value} is not a valid amenity" }
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :location, presence: true
  validates :price_per_night, presence: true

end
