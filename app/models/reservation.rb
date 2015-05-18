class Reservation < ActiveRecord::Base
	has_one :book
	has_many :librarians
	belongs_to :reader
end
