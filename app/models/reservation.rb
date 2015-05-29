class Reservation < ActiveRecord::Base
	has_one :book
	belongs_to :reader


def self.getReservations
	Reservation.all
	#find(:all, :conditions => ['reader_id = #{id}'])
end

end
