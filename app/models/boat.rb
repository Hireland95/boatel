class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :address, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
