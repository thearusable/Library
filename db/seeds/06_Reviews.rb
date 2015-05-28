#reviews - ready
400.times do |n|
    r = Review.new
    r.score =  Random.rand(9) + 1
    r.comment = Faker::Hacker.say_something_smart
    r.book_id =  Random.rand(3) + 1
    r.reader_id = Random.rand(99) + 1

    r.save
end