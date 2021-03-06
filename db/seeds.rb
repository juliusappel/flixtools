# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Appliance.destroy_all

12.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, username: Faker::Name.first_name, email: Faker::Internet.email, password: 'shawarma')
  cities = ['Cologne', 'Düsseldorf', 'Bonn', 'Frechen', 'Essen', 'Bochum', 'Koblenz']
  app = Appliance.create!(user: user, title: Faker::Appliance.brand + " " + Faker::Appliance.equipment,
    description: Faker::Lorem.sentence(word_count: 16),
    price: rand(1..10), location: cities.sample)
    # Convert price to integer and add € sign in view
  puts app.title
end
