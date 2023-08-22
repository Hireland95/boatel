# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

25.times do |t|
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.age = (18..60).to_a.sample
  user.phone_number = Faker::PhoneNumber.phone_number
  user.email = Faker::Internet.email
  user.password = "123456"
  user.save
end

Booking.destroy_all

Boat.destroy_all

30.times do |i|
  boat_type = ["Sailboat", "Motorboat", "Yacht", "Battleship", "Aircraft Carrier Ship", "Dinghy", "Submarine", "Pirate Ship"].sample
  Boat.create(
    name: "Boat #{i + 1}",
    user_id: (1..25).to_a.sample,
    image_url: "https://source.unsplash.com/1600x900/?#{boat_type}",
    address: Faker::Address.full_address,
    boat_type: boat_type,
    details: Faker::Lorem.paragraph(sentence_count: 2),
    price: rand(50..100).round(2)
  )
end


20.times do |i|
  booking = Booking.new
  booking.user_id = (1..25).to_a.sample
  booking.boat_id = (1..30).to_a.sample
end
