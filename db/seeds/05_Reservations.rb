#reservations - ready
100.times do |n|
    r = Reservation.new
    bool = [true, true, true, true, false].sample
    if bool == true #received true
    	r.received =  true
    	r.receivedDate = Date.yesterday
    	bool2 = [true, false, false].sample
    	r.returned = bool2
    	if bool2 == true
	    	r.returnedDate = Date.today
    	end	
    end

    if bool == false #
    	r.received = false
    	r.returned = false
    end

    r.reader_id =  Random.rand(99) + 1
    book = Random.rand(499) + 1
    r.book_id = book
    bb = Book.find(book)
    bb.current_reservation_id = n
    bb.save

    r.save
end