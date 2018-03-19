# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Book.destroy_all

puts 'Creating users...'
20.times do |i|
    User.create([
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email
    ])
end

puts 'Creating books...'
20.times do |i|
    Book.create([
        title: Faker::Book.title, 
        author: Faker::Book.author, 
        resume: Faker::Lorem.paragraph
    ])
end