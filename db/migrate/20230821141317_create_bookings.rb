class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :boat, null: false, foreign_key: true
      t.datetime :booking_date
      t.integer :boat_rating

      t.timestamps
    end
  end
end
