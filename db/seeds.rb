# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

(1..3).each  do |x|
  User.create(id: x ,email: "user#{x}@email.com",password:"password")
  rand(1..3).times do |y|
    Venue.create(name: Faker::University.name, location: Faker::Address.full_address, capacity: rand(10..200), venue_type: ['church', 'hall', 'theatre', 'restaurant', 'conference-center', 'Bar'].sample, details: Faker::Lorem.sentence, user_id: x, availability: true )
  end
end
