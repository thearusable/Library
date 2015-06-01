#admin - ready
Librarian.create(name: 'Testowy Admin', admin: true, email: 'admin@example.com', adress: 'daleko 16', phone: '0-700', password: 'password', password_confirmation: 'password');
Librarian.create(name: 'Testowy Bibliotekarz', admin: false, email: 'librarian@example.com', adress: 'daleko 16', phone: '0-700', password: 'password', password_confirmation: 'password');

UsersCount.times do |n|
    r = Librarian.new
    r.name =  Faker::Name.name
    r.admin = [false, true, false, false, false, false].sample
    r.email =  Faker::Internet.email 
    r.adress = Faker::Address.street_address 
    r.phone = Faker::PhoneNumber.cell_phone
    pass = Faker::Internet.password
    r.password = pass
    r.password_confirmation = pass

    r.last_sign_in_at = Faker::Date.backward(Random.rand(300))

    r.save
end