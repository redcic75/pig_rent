require 'open-uri'

puts "Cleaning the DB"
Rental.destroy_all
User.destroy_all
Pig.destroy_all

puts "DB cleaned"

puts "Creating 4 users"

gala = User.create!(email: 'gala@mail.com', password: "azerty", farmer: true, address: "Layrac", first_name: "Gala", last_name: "Thévenet")
gala.photo.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645623392/Users/gala_by9udp.jpg'), filename: 'gala_by9udp.jpg', content_type: 'image/jpg')
marion = User.create!(email: 'marion@mail.com', password: "marion", farmer: true, address: "Montauban", first_name: "Marion", last_name: "Santos")
marion.photo.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645623392/Users/marion2_dpnplg.jpg'), filename: 'marion2_dpnplg.jpg', content_type: 'image/jpg')
carole = User.create!(email: 'carole@mail.com', password: "carole", farmer: false, address: "Castres-Gironde", first_name: "Carole", last_name: "Chéné")
carole.photo.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645623392/Users/carole_s23qgu.jpg'), filename: 'carole_s23qgu.jpg', content_type: 'image/jpg')
cedric = User.create!(email: 'cedric@mail.com', password: "cedric", farmer: true, address: "Mérignac", first_name: "Cédric", last_name: "Louyot")
cedric.photo.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645623392/Users/cedric_peqsvm.jpg'), filename: 'cedric_peqsvm.jpg', content_type: 'image/jpg')

puts "Creating 9 pigs"

bernard = Pig.create!(name: 'bernard', required_space: 200, eat_capacity: 2, user: gala, daily_price: 10, rating: 3, active: true)
bernard.photos.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645623392/Cochons/cochon7_cfb5bf.jpg'), filename: 'cochon7_cfb5bf.jpg', content_type: 'image/jpg')

boris = Pig.create!(name: 'boris', required_space: 100, eat_capacity: 1, user: gala, daily_price: 15, rating: 4, active: true)
boris.photos.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645799151/Cochons/cochon8_hcg15u.jpg'), filename: 'cochon8_hcg15u.jpg', content_type: 'image/jpg')

barbara = Pig.create!(name: 'barbara', required_space: 100, eat_capacity: 1, user: marion, daily_price: 15, rating: 3, active: true)
barbara.photos.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645799150/Cochons/cochon3_rv4wqk.jpg'), filename: 'cochon3_rv4wqk.jpg', content_type: 'image/jpg')

bertrand = Pig.create!(name: 'bertrand', required_space: 200, eat_capacity: 1, user: marion, daily_price: 20, rating: 4)

baptiste = Pig.create!(name: 'baptiste', required_space: 100, eat_capacity: 1, user: marion, daily_price: 17, rating: 5, active: true)
baptiste.photos.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645799150/Cochons/cochon4_j4ikxu.jpg'), filename: 'cochon4_j4ikxu.jpg', content_type: 'image/jpg')

billy = Pig.create!(name: 'billy', required_space: 250, eat_capacity: 2, user: gala, daily_price: 10, rating: 2, active: true)
billy.photos.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645799150/Cochons/cochon6_hukvw3.jpg'), filename: 'cochon6_hukvw3.jpg', content_type: 'image/jpg')

barnabe = Pig.create!(name: 'barnabe', required_space: 50, user: marion, daily_price: 10, rating: 4, active: true)
barnabe.photos.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645799150/Cochons/cochon2_mymyjm.jpg'), filename: 'cochon2_mymyjm.jpg', content_type: 'image/jpg')

basile = Pig.create!(name: 'basile', eat_capacity: 1, user: cedric, daily_price: 15, rating: 1)
basile.photos.attach(io: URI.open('https://res.cloudinary.com/djcv5afgd/image/upload/v1645799150/Cochons/Cochon1_vxrnnn.jpg'), filename: 'Cochon1_vxrnnn.jpg', content_type: 'image/jpg')

bastien = Pig.create(name: 'bastien', required_space: 100, eat_capacity: 1, user: gala, daily_price: 15, rating: 5)

puts "Creating 4 rentals"

Rental.create!(user: gala, pig: basile, start_date: Date.today, end_date: Date.tomorrow, status: "accepted")
Rental.create!(user: gala, pig: barbara, start_date: Date.yesterday, end_date: Date.today, status: "rejected")
Rental.create!(user: gala, pig: baptiste, start_date: Date.new(2022, 2, 28), end_date: Date.new(2022, 3, 5), status: "pending")
Rental.create!(user: carole, pig: bertrand, start_date: Date.yesterday, end_date: Date.today, status: "pending")
Rental.create!(user: carole, pig: bernard, start_date: Date.today, end_date: Date.tomorrow, status: "pending")

puts "Creations done"
