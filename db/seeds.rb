# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#admin - ready
Librarian.delete_all
Librarian.new(name: 'Testowy', lastname: 'Admin', admin: true, email: 'admin@example.com', password: 'password', password_confirmation: 'password').save;

#bibliotekarze - ready
Librarian.new(name: 'Testowy', lastname: 'Librarian', email: 'librarian@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy2', lastname: 'Librarian2', email: 'librarian2@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy3', lastname: 'Librarian3', email: 'librarian3@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy4', lastname: 'Librarian4', email: 'librarian4@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy5', lastname: 'Librarian5', email: 'librarian5@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy6', lastname: 'Librarian6', email: 'librarian6@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy7', lastname: 'Librarian7', email: 'librarian7@example.com', password: 'password', password_confirmation: 'password').save;
Librarian.new(name: 'Testowy8', lastname: 'Librarian8', email: 'librarian8@example.com', password: 'password', password_confirmation: 'password').save;

#readers - ready
Reader.delete_all
Reader.new(name: 'Testowy', lastname: 'Reader1', email: 'reader@example.com', password: 'password', password_confirmation: 'password').save;
Reader.new(name: 'Testowy2', lastname: 'Reader2', email: 'reader2@example.com', password: 'password', password_confirmation: 'password').save;
Reader.new(name: 'Testowy3', lastname: 'Reader3', email: 'reader3@example.com', password: 'password', password_confirmation: 'password').save;
Reader.new(name: 'Testowy4', lastname: 'Reader4', email: 'reader4@example.com', password: 'password', password_confirmation: 'password').save;
Reader.new(name: 'Testowy5', lastname: 'Reader5', email: 'reader5@example.com', password: 'password', password_confirmation: 'password').save;
Reader.new(name: 'Testowy6', lastname: 'Reader6', email: 'reader6@example.com', password: 'password', password_confirmation: 'password').save;
Reader.new(name: 'Testowy7', lastname: 'Reader7', email: 'reader7@example.com', password: 'password', password_confirmation: 'password').save;
Reader.new(name: 'Testowy8', lastname: 'Reader8', email: 'reader8@example.com', password: 'password', password_confirmation: 'password').save;

#categories - ready
Category.delete_all
Category.new(name: 'Biografia', booksCount: 0).save;
Category.new(name: 'Fantastyka', booksCount: 0).save;
Category.new(name: 'Historyczna', booksCount: 0).save;
Category.new(name: 'Klasyka', booksCount: 0).save;
Category.new(name: 'Literatura Młodzieżowa', booksCount: 0).save;
Category.new(name: 'Literatura Faktu', booksCount: 0).save;
Category.new(name: 'Literatura Współczesna', booksCount: 0).save;
Category.new(name: 'Przygodowa', booksCount: 0).save;
Category.new(name: 'Romans', booksCount: 0).save;
Category.new(name: 'Kryminał', booksCount: 0).save;
Category.new(name: 'Dramat', booksCount: 0).save;
Category.new(name: 'Komedia', booksCount: 0).save;
Category.new(name: 'Astronomia', booksCount: 0).save;
Category.new(name: 'Finanse', booksCount: 0).save;
Category.new(name: 'Encyklopedie', booksCount: 0).save;
Category.new(name: 'Filozofia', booksCount: 0).save;
Category.new(name: 'Fauna i Flora', booksCount: 0).save;
Category.new(name: 'Podróżnicze', booksCount: 0).save;
Category.new(name: 'Informatyka', booksCount: 0).save;
Category.new(name: 'Matematyka', booksCount: 0).save;
Category.new(name: 'Popularnonałkowe', booksCount: 0).save;
Category.new(name: 'Poradniki', booksCount: 0).save;

#writers - ready
Writer.delete_all
w1 = Writer.create(name: 'Testowy1', lastname: 'Writer', biography: 'nie ma', nationality: 'kto to wie', image: 'not find :D');
w2 = Writer.create(name: 'Testowy2', lastname: 'Writer', biography: 'nie ma', nationality: 'kto to wie', image: 'not find :D');

#books - ready
Book.delete_all
b1 = Book.create(title: 'Book1', description: '', category_id: 3, reservation_id: 5);
w1.books << b1;
w2.books << b1;
w1.books << Book.create(title: 'Book4', description: '', category_id: 2, reservation_id: 2);
w1.books << Book.create(title: 'Book3', description: '', category_id: 5, reservation_id: 1);
w2.books << Book.create(title: 'Book4', description: '', category_id: 2, reservation_id: 2);

#reservations - ready
Reservation.delete_all
Reservation.new(received: true, returned: false, reader_id: 1).save;
Reservation.new(received: false, returned: false, reader_id: 1).save;
Reservation.new(received: false, returned: false, reader_id: 1).save;
Reservation.new(received: true, returned: true, reader_id: 1).save;
Reservation.new(received: true, returned: true, reader_id: 1).save;
Reservation.new(received: false, returned: false, reader_id: 2).save;
Reservation.new(received: true, returned: false, reader_id: 3).save;

#reviews - ready
Review.delete_all
Review.new(score: 4, comment: 'test1', book_id: 1, reader_id: 1).save;
Review.new(score: 3, comment: 'test2', book_id: 1, reader_id: 1).save;
Review.new(score: 10, comment: 'test3', book_id: 1, reader_id: 1).save;
Review.new(score: 2, comment: 'test4', book_id: 1, reader_id: 1).save;
Review.new(score: 3, comment: 'test5', book_id: 1, reader_id: 1).save;
Review.new(score: 5, comment: 'test6', book_id: 1, reader_id: 1).save;
Review.new(score: 6, comment: 'test7', book_id: 1, reader_id: 1).save;
Review.new(score: 8, comment: 'test8', book_id: 1, reader_id: 1).save;