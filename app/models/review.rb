class Review < ApplicationRecord
  belongs_to :yacht
  belongs_to :user
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end
