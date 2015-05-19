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
