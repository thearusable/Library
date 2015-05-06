# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#admin
Librarian.new(name: 'Testowy', lastname: 'Admin', admin: true, email: 'admin@example.com', password: 'password', password_confirmation: 'password').save;
#bibliotekarze
Librarian.new(name: 'Testowy2', lastname: 'Librarian2', email: 'librarian2@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy3', lastname: 'Librarian3', email: 'librarian3@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy4', lastname: 'Librarian4', email: 'librarian4@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy5', lastname: 'Librarian5', email: 'librarian5@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy6', lastname: 'Librarian6', email: 'librarian6@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy7', lastname: 'Librarian7', email: 'librarian7@example.com', password: 'password', password_confirmation: 'password').save;


