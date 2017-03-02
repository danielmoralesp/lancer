# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.where(name: "Web Development").first_or_create(name: "Web Development")
Category.where(name: "Design").first_or_create(name: "Design")
Category.where(name: "Finance").first_or_create(name: "Finance")
Category.where(name: "Engenering").first_or_create(name: "Engenering")
Category.where(name: "Sales").first_or_create(name: "Sales")
Category.where(name: "Administrator").first_or_create(name: "Administrator")


location = [
  "Denver, CO",
  "San Francisco, CA",
  "Minneapolis, MN",
  "New York, NY",
  "Atlanta, GA",
  "Miami, FL",
  "Austin, TX",
  "Boston, MA"
]

User.where(email: "danielmorales1202@gmail.com").first_or_create(email: "danielmorales1202@gmail.com", name: "Daniel Morales", password: "dfmp1202242")

10.times do
  User.create(email: Faker::Internet.email, password: "dfmp1202242", name: Faker::Name.name)
end

100.times do
  Gig.create(name: Faker::Name.title,
             description: Faker::Lorem.paragraph(2),
             budget: rand(200..10000),
             location: location.sample,
             user_id: rand(1..10),
             category_id: rand(2..3))
end
