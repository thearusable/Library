#readers - ready
Reader.create(
	id: 1,
	name: "Testowy Reader",
	email: "reader@example.com",
	adress: "daleko 16",
	phone: "0-700",
	password: "password",
	password_confirmation: "password")

100.times do |n|
    r = Reader.new
    r.name =  Faker::Name.name
    r.email =  Faker::Internet.email 
    r.adress = Faker::Address.street_address 
    r.phone = Faker::PhoneNumber.cell_phone
    pass = Faker::Internet.password
    r.password = pass
    r.password_confirmation = pass

    r.last_sign_in_at = Faker::Date.backward(Random.rand(300))

    r.save
end
