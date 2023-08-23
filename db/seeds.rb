# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

Booking.destroy_all
Yacht.destroy_all
User.destroy_all

puts "DB cleaned"


10.times do |i|
  user = User.create!(email: Faker::Internet.email, password: Faker::Internet.password, first_name: Faker::GreekPhilosophers.name, last_name: Faker::Artist.name, bio: Faker::Movies::PrincessBride.quote)
  puts "User #{i+1} created"
  3.times do
    yacht = Yacht.new(capacity: rand(0..20), price_per_night: rand(100..900), name: Faker::FunnyName.name, description: Faker::Restaurant.description, location: Faker::Address.street_address, amenities: "helipad")
    yacht.user = user
    yacht.save!
    puts "Yacht created"
  end
end

#User.create(email: "tom@lw.org", encrypted_password: "123456", first_name: "tom", last_name: "fallis", bio: "I like big yacths and I cannot lie")
