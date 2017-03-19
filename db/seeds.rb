rab1 = Rabbi.create(name: "Bill Toms", age: 50, years_of_experience: 10, branch_of_judaism: "reform", temple: "Temple rodef mammon", charisma_level: 10, city: "nowherevile, AK")


rab2 = Rabbi.create(name: "roger desnenberg", age: 50, years_of_experience: 2, branch_of_judaism: "reform", temple: "Temple sholom", charisma_level: 2, city: "los angeles, CA")

user1 = User.create(name: "tyler albertoson", email: "tyeler@example.com", age: 42, married: true, children: true, occupation: "farmer", birthday: "1977-03-01", bothersome_level: 9, password: "password")

user2 = User.create(name: "Rachel Toads", email: "rachel@example.com", age: 22, married: false, children: false, occupation: "Bartender", birthday: "1999-03-01", bothersome_level: 2, password: "password")

ser1 = Service.create(name: "Marrige Cermony", fee: 675)

ser2 = Service.create(name: "Counsouling session", fee: 955)


Appointment.create(rabbi_id: rab2.id, user_id: user2.id, service_id: ser1.id, starttime: "2016-09-03 04:30")

Appointment.create(rabbi_id: rab2.id, user_id: user1.id, service_id: ser2.id, starttime: "2017-05-01 07:15")


Appointment.create(rabbi_id: rab1.id, user_id: user1.id, service_id: ser2.id, starttime: "2017-07-02 02:45")
