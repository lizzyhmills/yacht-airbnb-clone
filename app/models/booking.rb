class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yacht
  validates :check_in, :check_out, :guests, presence: true
end
