#admin - ready
Librarian.create(name: 'Admin', lastname: 'Admin', admin: true, email: 'admin@example.com', adress: 'daleko 16', phone: '0-700', password: 'password', password_confirmation: 'password');
Librarian.create(name: 'Librarian', lastname: 'Librarian', admin: false, email: 'librarian@example.com', adress: 'daleko 16', phone: '0-700', password: 'password', password_confirmation: 'password');

100.times do |n|
    r = Librarian.new
    r.name =  Faker::Name.first_name
    r.lastname = Faker::Name.last_name
    r.admin = [false, true, false, false, false, false].sample
    r.email =  Faker::Internet.email 
    r.adress = Faker::Address.street_address 
    r.phone = Faker::PhoneNumber.cell_phone
    pass = Faker::Internet.password
    r.password = pass
    r.password_confirmation = pass

    r.save
end