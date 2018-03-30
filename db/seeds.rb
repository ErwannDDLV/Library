# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Reservation.destroy_all
User.destroy_all
Book.destroy_all

avatar = File.new(Rails.root.join('app/assets/images/profil.png'))

10.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        avatar: File.new(Rails.root.join('app/assets/images/medium/missing.png'))
    )
end

erwann = User.create(first_name: 'Erwann', last_name: 'de Dieuleveult', email: 'ededieuleveult@gmail.com', avatar: avatar)
arthur = User.create(first_name: 'Arthur', last_name: 'Dupont', email: 'a.dupont@tutu.com', avatar: avatar)

puts 'Users created'

10.times do |i|
    Book.create(
        title: Faker::Book.title, 
        author: Faker::Book.author, 
        resume: Faker::Lorem.paragraph,
        aasm_state: "available"
    )
end

griffe = Book.create(
    title: 'La griffe du chien', 
    author: 'Don Winslow', 
    resume: "Seigneur de la frontière américano-mexicaine, Art Keller, agent de la DEA, l'a juré sur la tombe de son adjoint : il emploiera tous les moyens, légaux ou illégaux, pour mettre un terme au trafic qui inonde son pays. Face à lui, Adán Barrera règne sans partage sur les sicarios. Ni la justice ni la foi ne veulent plus rien dire. Seul l'instinct s'impose : celui qui tue, celui qui sauve.",
    book_cover: File.new(Rails.root.join('app/assets/images/La_griffe_du_chien.jpg')),
    aasm_state: "borrowed")

cartel = Book.create(
    title: 'Cartel', 
    author: 'Don Winslow', 
    resume: "La suite de la griffe du chien",
    book_cover: File.new(Rails.root.join('app/assets/images/Cartel.jpg')),
    aasm_state: "borrowed")

puts 'Books created'

Reservation.create(user: erwann, book: griffe)
Reservation.create(user: arthur, book: cartel)

puts 'Reservations created'