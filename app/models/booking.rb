class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  validates :user, presence: true
  validates :boat, presence: true
  validates :booking_date, presence: true
end
