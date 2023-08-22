class AddEnddateToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :enddate, :date
  end
end
