class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :address, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :boat_type, presence: true
  validates :photos, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
