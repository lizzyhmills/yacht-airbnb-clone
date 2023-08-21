class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :bio, presence: true, length: { minimum: 5 }
  has_many :yachts, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
