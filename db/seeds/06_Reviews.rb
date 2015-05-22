#reviews - ready
Review.delete_all
Review.create(score: 4, comment: 'test1', book_id: 1, reader_id: 1);
Review.create(score: 3, comment: 'test2', book_id: 2, reader_id: 1);
Review.create(score: 10, comment: 'test3', book_id: 1, reader_id: 1);
Review.create(score: 2, comment: 'test4', book_id: 3, reader_id: 1);
Review.create(score: 3, comment: 'test5', book_id: 2, reader_id: 1);
Review.create(score: 5, comment: 'test6', book_id: 3, reader_id: 1);
Review.create(score: 6, comment: 'test7', book_id: 2, reader_id: 1);
Review.create(score: 8, comment: 'test8', book_id: 1, reader_id: 1);