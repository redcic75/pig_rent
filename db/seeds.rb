puts "Cleaning the DB"
Rental.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Pig.destroy_all if Rails.env.development?

puts "DB cleaned"


puts "Creating 4 users"

gala = User.create(email: 'gala@mail.com', password: "azerty")
marion = User.create(email: 'marion@mail.com', password: "marion")
carole = User.create(email: 'carole@mail.com', password: "carole")
cedric = User.create(email: 'cedric@mail.com', password: "cedric")

# User.create(email: 'gala@mail.com', password: "azerty", farmer: true, address: "Bourret", first_name: "Gala", last_name: "Thevenet")
# User.create(email: 'marion@mail.com', password: "marion", farmer: false, address: "Montauban", first_name: "Marion", last_name: "Santos")
# User.create(email: 'carole@mail.com', password: "carole", farmer: false, address: "Castres-Gironde", first_name: "Carole", last_name: "Chéné")
# User.create(email: 'cedric@mail.com', password: "cedric", farmer: true, address: "Mérignac", first_name: "Cédrir", last_name: "Louyot")


puts "Creating 4 pigs"

bernadette = Pig.create(name: 'bernadette', required_space: 200, eat_capacity: 2, user: gala, daily_price: 10)
boris = Pig.create(name: 'boris', required_space: 100, eat_capacity: 1, user: gala, daily_price: 15)
barbara = Pig.create(name: 'barbara', user: marion, daily_price: 15)
bertrand = Pig.create(name: 'bertrand', required_space: 130, eat_capacity: 2, user: marion, daily_price: 20)

puts "Creating 4 rentals"

Rental.create(user: carole, pig: bertrand, start_date: Date.yesterday, end_date: Date.today, status: "pending")
Rental.create(user: cedric, pig: boris, start_date: Date.today, end_date: Date.tomorrow, status: "accepted")
Rental.create(user: cedric, pig: barbara, start_date: Date.yesterday, end_date: Date.today, status: "rejected")
Rental.create(user: marion, pig: bernadette, start_date: Date.today, end_date: Date.tomorrow, status: "pending")

puts "Creations done"
