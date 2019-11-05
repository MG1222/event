require 'faker'
User.destroy_all
Event.destroy_all
Attendance.destroy_all
puts "ok"

users = []
events = []

30.times do |index|
  first_name = Faker::Name.first_name
  users << User.create!(first_name: first_name, last_name: Faker::Name.last_name, description: Faker::Quote.famous_last_words, email: (first_name.downcase + "@yopmail.com"), password: "secret")
end
puts "ok"
15.times do |index|    					
  events << Event.create!(start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now + 120, format: :long) , duration: (rand(6..48) * 5), title: Faker::Hipster.sentence(word_count: 2), description: Faker::Hipster.sentence, price: rand(1..220), location: "Bordeaux", user: users.sample)
end
puts "ok"
50.times do |index|
  Attendance.create(user: users.sample, event: events.sample)
end
