class Reservation < ActiveRecord::Base
	has_one :book
	belongs_to :reader

	def self.res
		if !@current_reservation_id 
			return 1
		#Reservation.create(:received=>false, :returned=>false, :receivedDate=>nil, :returnedDate=>nil, :reader_id => params[:id], :book_id=>params[:bookID])
	    else
	    return 0
	    end
	end
end
