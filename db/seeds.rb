# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |t|
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.age = (18..60).to_a.sample
  user.phone_number = Faker::PhoneNumber.phone_number
  user.email = Faker::Internet.email
  user.password = "123456"
  user.save
end

boat = Boat.new
boat.address = Faker::Address.full_address
boat.name = "Flying Dutchman"
boat.image_url = "https://d23.com/app/uploads/2020/06/1180w-600h_01_0834-P2C-21187_R.jpg"
boat.price = 55.9
boat.user_id = 1
boat.save

booking = Booking.new
booking.user_id = 1
booking.boat_id = 1
# booking.date = DateTime.now
booking.save
