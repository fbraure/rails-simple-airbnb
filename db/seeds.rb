# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "SEED : Clean DB"
Flat.destroy_all
puts "SEED : Start populate"
10.times do
  Flat.create!(
    name: Faker::Restaurant.name,
    address: '10 Clifton Gardens London W9 1DT',
    description:  Faker::Address.city,
    price_per_night: (50..300).to_a.sample,
    number_of_guests: (1..10).to_a.sample,
    picture_url: Faker::LoremFlickr.image
  )
end
puts "SEED : Populate done"
