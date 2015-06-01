#reviews - ready
ReviewsCount.times do |n|
    r = Review.new
    r.score =  Random.rand(10) + 1
    r.comment = Faker::Hacker.say_something_smart
    r.book_id =  Random.rand(BooksCount) + 1
    r.reader_id = Random.rand(UsersCount) + 1

    r.save
end

#average rating
(BooksCount-1).times do |n|
	revs = Review.where({book_id: n+1})
	sum = 0
	revs.each do |r|
		sum += r.score
	end
	book = Book.find(n+1)
	if revs.count > 0
		book.averageRating = sum / revs.count
	else
		book.averageRating = nil
	end
	book.save
end