#reviews - ready
400.times do |n|
    r = Review.new
    r.score =  Random.rand(10) + 1
    r.comment = Faker::Hacker.say_something_smart
    r.book_id =  Random.rand(399) + 1
    r.reader_id = Random.rand(99) + 1

    r.save
end

#average rating
499.times do |n|
	revs = Review.where({id: n+1})
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