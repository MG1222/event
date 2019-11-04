# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

puts "clean"


5.times do
  city = ["Bordeaux", "Arcachon", "Toulouse", "Nante"].sample
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10, supplemental: true), email: "#{Faker::Name.first_name}@yopmail.com", encrypted_password: 'password')

  event = Event.create(title: Faker::Game.title, description: Faker::Lorem.sentence(word_count: 120, supplemental: true),price: Faker::Number.between(from: 1, to: 1000), user_id: user.id, location: city, start_date: Faker::Date.forward(days: 23), duration: Faker::Number.between(from: 1, to: 120))
  
  attendance_1 = Attendance.create(stripe_customer_id: Faker::IDNumber.brazilian_citizen_number, user_id: user.id, event_id: Event.first.id)
  attendance_2 = Attendance.create(stripe_customer_id: Faker::IDNumber.brazilian_citizen_number, user_id: user.id, event_id: Event.first.id)
end
puts "ok "