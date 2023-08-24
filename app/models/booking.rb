class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  validates :booking_date, presence: true
  validates :enddate, presence: true

  def start_time
    self.booking_date
  end

  def end_time
    self.enddate
  end
end
