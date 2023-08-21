class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  validates :booking_date, presence: true
end
