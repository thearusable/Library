class Reservation < ActiveRecord::Base
	has_one :book
	belongs_to :reader
end
