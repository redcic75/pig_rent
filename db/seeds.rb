require 'open-uri'

puts "Cleaning the DB"
Rental.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Pig.destroy_all if Rails.env.development?

puts "DB cleaned"

puts "Creating 4 users"

gala = User.create(email: 'gala@mail.com', password: "azerty", farmer: true, address: "Bourret", first_name: "Gala", last_name: "Thevenet")
marion = User.create(email: 'marion@mail.com', password: "marion", farmer: false, address: "Montauban", first_name: "Marion", last_name: "Santos")
carole = User.create(email: 'carole@mail.com', password: "carole", farmer: false, address: "Castres-Gironde", first_name: "Carole", last_name: "Chéné")
cedric = User.create(email: 'cedric@mail.com', password: "cedric", farmer: true, address: "Mérignac", first_name: "Cédrir", last_name: "Louyot")

puts "Creating 4 pigs"

bernadette = Pig.create(name: 'bernadette', required_space: 200, eat_capacity: 2, user: gala, daily_price: 10)
bernadette.photos.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645623392/Cochons/images_ry5wnp.jpg'), filename: 'images_ry5wnp.jpg', content_type: 'image/jpg')

boris = Pig.create(name: 'boris', required_space: 100, eat_capacity: 1, user: gala, daily_price: 15)
boris.photos.attach(io: URI.open('https://res.cloudinary.com/de2xlu7kn/image/upload/v1645623146/Cochons/cochon_sdpq9x.jpg'), filename: 'cochon_sdpq9x.jpg', content_type: 'image/jpg')

barbara = Pig.create(name: 'barbara', required_space: 100, eat_capacity: 1, user: marion, daily_price: 15)
barbara.photos.attach(io: URI.open('https://res.cloudinary.com/de2xlu7kn/image/upload/v1645623146/Cochons/cochon4_yuqmup.jpg'), filename: 'cochon4_yuqmup.jpg', content_type: 'image/jpg')

bertrand = Pig.create(name: 'bertrand', user: marion, daily_price: 20)

baptiste = Pig.create(name: 'baptiste', required_space: 100, eat_capacity: 1, user: marion, daily_price: 17)
baptiste.photos.attach(io: URI.open('https://res.cloudinary.com/de2xlu7kn/image/upload/v1645623146/Cochons/cochon3_c2v1lz.jpg'), filename: 'cochon3_c2v1lz.jpg', content_type: 'image/jpg')

billy = Pig.create(name: 'billy', required_space: 250, eat_capacity: 2, user: gala, daily_price: 10)
billy.photos.attach(io: URI.open('https://res.cloudinary.com/de2xlu7kn/image/upload/v1645623146/Cochons/cochon2_bef3gw.jpg'), filename: 'cochon2_bef3gw.jpg', content_type: 'image/jpg')

barnabe = Pig.create(name: 'barnabe', required_space: 50, user: gala, daily_price: 10)
barnabe.photos.attach(io: URI.open('https://res.cloudinary.com/de2xlu7kn/image/upload/v1645621298/Cochons/c56a42fb04d265d2232db752cb71a4f1--pet-pigs-guinea-pigs_hkmlxp.jpg'), filename: 'c56a42fb04d265d2232db752cb71a4f1--pet-pigs-guinea-pigs_hkmlxp.jpg', content_type: 'image/jpg')

basile = Pig.create(name: 'basile', eat_capacity: 1, user: gala, daily_price: 15)
basile.photos.attach(io: URI.open('https://res.cloudinary.com/de2xlu7kn/image/upload/v1645611529/Cochons/q3sori3oseeqjplwhcnu.jpg'), filename: 'q3sori3oseeqjplwhcnu.jpg', content_type: 'image/jpg')

bastien = Pig.create(name: 'bastien', required_space: 100, eat_capacity: 1, user: gala, daily_price: 15)

puts "Creating 4 rentals"

Rental.create(user: carole, pig: bertrand, start_date: Date.yesterday, end_date: Date.today, status: "pending")
Rental.create(user: cedric, pig: boris, start_date: Date.today, end_date: Date.tomorrow, status: "accepted")
Rental.create(user: cedric, pig: barbara, start_date: Date.yesterday, end_date: Date.today, status: "rejected")
Rental.create(user: marion, pig: bernadette, start_date: Date.today, end_date: Date.tomorrow, status: "pending")

puts "Creations done"
