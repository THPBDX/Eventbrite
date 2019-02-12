require 'faker'

10.times do |index|


user1 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, description: Faker::Hipster.paragraph, encrypted_password: Faker::Internet.password)

user2 = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, description: Faker::Hipster.paragraph, encrypted_password: Faker::Internet.password)


event1 = Event.create!(start_date: Faker::Date.forward(60), duration: [5,10,15,20,25,30,60,90,180,120].sample, description: Faker::Hipster.sentence, price: rand(1..1000), location: Faker::Address.city, title:Faker::BreakingBad.episode, organiser: user1)

event2 = Event.create!(start_date: Faker::Date.forward(60), duration: [5,10,15,20,25,30,60,90,180,120].sample, description: Faker::Hipster.sentence, price: rand(1..1000), location: Faker::Address.city, title:Faker::BreakingBad.episode, organiser: user2)


attendance1 = Attendance.create!(participant: user1, event: event1)
attendance2 = Attendance.create!(participant: user2,  event: event1)
attendance2 = Attendance.create!(participant: user2,  event: event2)

end

esteban = User.create!(first_name: "esteban", last_name: "petaflop", email: "esteban@yopmail.com", description: "yoyoyooyoyoyooyoy", encrypted_password: "lemotdepassetropbien")

misa = User.create!(first_name: "misa", last_name: "kitta", email: "misa@yopmail.com", description: "yoyoyooyoyoyooyoy", encrypted_password: "lemotdepassetropbien2")


event3 = Event.create!(start_date: Faker::Date.forward(60), duration: [5,10,15,20,25,30,60,90,180,120].sample, description: Faker::Hipster.sentence, price: rand(1..1000), location: Faker::Address.city, title:Faker::BreakingBad.episode, organiser: esteban)

attendance3 = Attendance.create!(participant: misa,  event: event3)
