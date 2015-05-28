#reservations - ready

#received and returned
100.times do |n|
    r = Reservation.new
    r.received =  true
    r.returned = true
    r.reader_id =  Random.rand(399) + 1
    r.book_id = Random.rand(399) + 1

    r.save
end