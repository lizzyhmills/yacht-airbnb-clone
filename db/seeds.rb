# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

Booking.destroy_all
Yacht.destroy_all
User.destroy_all

puts "DB cleaned"

User.create!(email: "tom@lw.org", password: "123456", first_name: "Tom", last_name: "Fallis", bio: "Yachts up! Keen yachter just looking for my perfect yachting holiday. Hopefully SEA you soon ;-)")
puts " Tom created"
User.create!(email: "liz@lw.org", password: "123456", first_name: "Liz", last_name: "Mills", bio: "I like big boats and I cannot lie")
puts "Liz created"
User.create!(email: "nico@lw.org", password: "123456", first_name: "Nico", last_name: "Grubi", bio: "Proud yacht owner of 6 with my hubby, love all things yachts")
puts " Nico created"
User.create!(email: "bark@lw.org", password: "123456", first_name: "Barkhadle", last_name: "Yusuf", bio: "Man of the sea, big yachts bigger personality...")
puts " Barkhadle created"

puts "creating yachts"

yacht_locations = [
  "20200 Bastia, France",
  "Harbour Island, Bahamas",
  "Campania, Italy",
  "La Romana, Dominican Republic",
  "Portsmouth Harbour",
  "83990 Saint-Tropez, France",
  "Porto di Sant'Erasmo, Italy",
  "Port of Amsterdam"
]

User.all.each do |user|
  5.times do
    file = URI.open("https://source.unsplash.com/random?yacht")
    file2 = URI.open("https://source.unsplash.com/random?kitchen")
    file3 = URI.open("https://source.unsplash.com/random?living-room")
    file4 = URI.open("https://source.unsplash.com/random?bedroom")
    file5 = URI.open("https://source.unsplash.com/random?boat-deck")
    yacht = Yacht.new(capacity: rand(1..20), price_per_night: rand(100..900), name: Faker::TvShows::RuPaul.queen, description: Faker::Restaurant.description, location: yacht_locations.sample, amenities: "helipad")
    yacht.user = user
    yacht.photos.attach(io: file, filename: "yacht.png", content_type: "image/png")
    yacht.photos.attach(io: file2, filename: "kitchen.png", content_type: "image/png")
    yacht.photos.attach(io: file3, filename: "lounge.png", content_type: "image/png")
    yacht.photos.attach(io: file4, filename: "bedroom.png", content_type: "image/png")
    yacht.photos.attach(io: file5, filename: "deck.png", content_type: "image/png")
    yacht.save
  end
end
puts "yachts created"


puts "creating bookings"
user = User.find_by(first_name: "Tom")
user2 = User.find_by(first_name: "Liz")
Booking.create!(user: user, yacht: user2.yachts.last, check_in: '2023-02-23', check_out: '2023-03-01', guests: 4)
Booking.create!(user: user, yacht: user2.yachts.first, check_in: '2023-03-25', check_out: '2023-04-02', guests: 7)
puts "2 bookings created"
