# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rab1 = Rabbi.create(name: "Bill Toms", age: 50, years_of_experience: 10, branch_of_judaism: "reform", temple: "Temple rodef mammon", charisma_level: 10, city: "nowherevile, AK")


rab2 = Rabbi.create(name: "roger desnenberg", age: 50, years_of_experience: 2, branch_of_judaism: "reform", temple: "Temple sholom", charisma_level: 2, city: "los angeles, CA")

user1 = User.create(name: "tyler albertoson", email: "tyeler@example.com", age: 42, married: true, children: true, occupation: "farmer", birthday: "1977-03-01", bothersome_level: 9, password: "password")

user2 = User.create(name: "Rachel Toads", email: "rachel@example.com", age: 22, married: false, children: false, occupation: "Bartender", birthday: "1999-03-01", bothersome_level: 2, password: "password")

ser1 = Service.create(name: "Marrige Cermony", fee: 675)

ser2 = Service.create(name: "Counsouling session", fee: 955)


Appointment.create(rabbi_id: rab2.id, user_id: user2.id, service_id: ser1.id, time: 533, date: "2017-02-09")

Appointment.create(rabbi_id: rab2.id, user_id: user1.id, service_id: ser2.id, time: 200, date: "2017-05-01")


Appointment.create(rabbi_id: rab1.id, user_id: user1.id, service_id: ser2.id,  time: 330, date: "2017-07-02")
