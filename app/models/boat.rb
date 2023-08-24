class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :address, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
