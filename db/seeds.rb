rab1 = Rabbi.create(first_name: "Arthur", last_name: "Markson", branch_of_judaism: "reform",    temple: "Temple rodef mammon", charisma_level: 3, city: "nowherevile, AK")


rab2 = Rabbi.create(first_name: "Roger", last_name: "Desnenberg", branch_of_judaism: "reform", temple: "Temple sholom",dob: "1985-08-02", charisma_level: 4, city: "los angeles, CA")

rab3 = Rabbi.create(first_name: "Jackson", last_name: "Jakes" , branch_of_judaism: "reform", dob: "1988-03-08",  temple: "Temple sholom", charisma_level: 5, city: "los angeles, CA")

rab2 = Rabbi.create(first_name: "Olivia", last_name: "Oliver"   , branch_of_judaism: "reform", temple: "Temple sholom", dob: "1990-04-06", charisma_level: 1, city: "los angeles, CA")

user1 = User.create(name: "tyler albertson", email: "tyeler@example.com",        password: "password")

admin = User.create(name: "admin", email: "admin@admin.com", password: "password", role: 1)

user4 = User.create(name: "Rachel Toads", email: "rachel@example.com",    password: "password")

user2 = User.create(name: "joe Toads", email: "joe@example.com",        password: "password")



ser3 = Service.create(name: "Business Advice", fee: 877)

ser6 = Service.create(name: "Coffee Meetup", fee: 250)
ser1 = Service.create(name: "Lecture on your favorite topic", fee: 330)

ser2 = Service.create(name: "Koshering the Kitchen", fee: 180)

DateTime.parse("2018-09-03 04:30").strftime("%H%M").to_i


Appointment.new(rabbi_id: rab2.id, user_id: user2.id, service_id: ser1.id, time_and_date: "2018-09-03 11:30")

Appointment.create(rabbi_id: rab2.id, user_id: user2.id, service_id: ser1.id, time_and_date: "2018-09-03 10:00")

Appointment.create(rabbi_id: rab2.id, user_id: user1.id, service_id: ser2.id, time_and_date: "2018-05-01 13:00")


Appointment.create(rabbi_id: rab1.id, user_id: user1.id, service_id: ser2.id, time_and_date: "2018-07-02 09:45")

Appointment.create(rabbi_id: rab2.id, user_id: user2.id, service_id: ser2.id, time_and_date: "2018-05-01 08:45")


Appointment.create(rabbi_id: rab1.id, user_id: user2.id, service_id: ser2.id, time_and_date: "2018-07-02 13:45")
