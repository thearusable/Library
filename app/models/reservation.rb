class Reservation < ActiveRecord::Base
	has_one :book
	belongs_to :reader

	def received=(val)
		write_attribute(:received, val)
		if self.received
			self.receivedDate ||= Date.today
		else
			self.receivedDate = nil
		end
	end

	def returned=(val)
		write_attribute(:returned, val)
		if self.returned
			self.returnedDate ||= Date.today
		else
			self.returnedDate = nil
		end
	end

end

 
        