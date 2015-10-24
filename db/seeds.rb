# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

puts 'Seeds: start'

5.times do
  user = User.new(
    name: Faker::Name.name,
    password: '12345678',
    email: Faker::Internet.email
  )
  user.add_role :student
  user.save
end

teacher = User.new(
	name: Faker::Name.name,
  password: '12345678',
  email: Faker::Internet.email
)
teacher.add_role :teacher
teacher.save

6.times do
  event = Event.new(
    place: Faker::Address.city,
    start_time: Faker::Date.between(5.days.since, 40.days.since),
    user_deadline: Faker::Date.between(2.days.since, 35.days.since),
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentences,
    slots: Faker::Number.between(10, 30)
  )
  event.save
end

puts 'Seeds: done'