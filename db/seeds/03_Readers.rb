#readers - ready
Reader.create(
	id: 1,
	name: "Reader",
	lastname: "Reader",
	email: "reader@example.com",
	adress: "daleko 16",
	phone: "0-700",
	password: "password",
	password_confirmation: "password")

200.times do |n|
    r = Reader.new
    r.name =  Faker::Name.first_name
    r.lastname = Faker::Name.last_name
    r.email =  Faker::Internet.email 
    r.adress = Faker::Address.street_address 
    r.phone = Faker::PhoneNumber.cell_phone
    pass = Faker::Internet.password
    r.password = pass
    r.password_confirmation = pass

    r.save
end
